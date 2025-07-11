(* Js_of_ocaml compiler
 * http://www.ocsigen.org/js_of_ocaml/
 * Copyright (C) 2020 Hugo Heuzard
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, with linking exception;
 * either version 2.1 of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *)

open! Js_of_ocaml_compiler.Stdlib
open Js_of_ocaml_compiler
open Cmdliner

type options =
  { files : string list
  ; output_file : string
  ; include_dirs : string list
  }

let options =
  let files =
    let doc = "Embed [$(docv)] in the js_of_ocaml pseudo filesystem." in
    Arg.(value & pos_all string [] & info [] ~docv:"FILES" ~doc)
  in
  let output_file =
    let doc = "Set output file name to [$(docv)]." in
    Arg.(required & opt (some string) None & info [ "o" ] ~docv:"FILE" ~doc)
  in
  let include_dirs =
    let doc = "Add [$(docv)] to the list of include directories." in
    Arg.(value & opt_all string [] & info [ "I" ] ~docv:"DIR" ~doc)
  in
  Term.(
    const (fun files output_file include_dirs -> { files; output_file; include_dirs })
    $ files
    $ output_file
    $ include_dirs)

let f { files; output_file; include_dirs } =
  let code =
    {|
//Provides: jsoo_create_file_extern
function jsoo_create_file_extern(name,content){
  if(globalThis.jsoo_create_file)
    globalThis.jsoo_create_file(name,content);
  else {
    if(!globalThis.jsoo_fs_tmp) globalThis.jsoo_fs_tmp = [];
    globalThis.jsoo_fs_tmp.push({name:name,content:content});
  }
  return 0;
}
|}
  in
  Config.set_target `JavaScript;
  Config.set_effects_backend `Disabled;
  let fragments = Linker.Fragment.parse_string code in
  Linker.load_fragments ~target_env:Isomorphic ~filename:"<dummy>" fragments;
  Linker.check_deps ();
  let include_dirs =
    List.filter_map (include_dirs @ [ "+stdlib/" ]) ~f:(fun d -> Findlib.find [] d)
  in
  let instr =
    Pseudo_fs.f ~prim:`create_file_extern ~cmis:StringSet.empty ~files ~paths:include_dirs
  in
  let code = Code.prepend Code.empty instr in
  Filename.gen_file output_file (fun chan ->
      let pfs_fmt = Pretty_print.to_out_channel chan in
      let (_ : Source_map.info * Shape.t StringMap.t) =
        Driver.f
          ~standalone:true
          ~wrap_with_fun:`Iife
          ~link:`Needed
          ~formatter:pfs_fmt
          ~source_map:false
          code
      in
      ())

let info =
  Info.make
    ~name:"build-fs"
    ~doc:"Js_of_ocaml pseudo filesystem utility"
    ~description:
      "jsoo_fs is a tool for embeding files in a Js_of_ocaml pseudo filesystem."

let command =
  let t = Cmdliner.Term.(const f $ options) in
  Cmdliner.Cmd.v info t
