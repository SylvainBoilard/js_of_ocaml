# dev

## Features/Changes
* Misc: drop support for OCaml 4.12 and bellow
* Misc: switch to dune.3.19
* Misc: initial support for ocaml 5.4 (#2030)
* Compiler: use a Wasm text files preprocessor (#1822)
* Compiler: support for OCaml 4.14.3+trunk (#1844)
* Compiler: optimize compilation of switches
* Compiler: evaluate statically more primitives (#1912, #1915, #1965, #1969)
* Runtime: use es6 class (#1840)
* Runtime: support more Unix functions (#1829)
* Runtime: remove polyfill for Map to simplify MlObjectTable implementation (#1846)
* Runtime: refactor caml_xmlhttprequest_create implementation (#1846)
* Runtime: update constant imports to use `node:fs` module (#1850)
* Runtime: make Obj.dup work with floats and boxed numbers (#1871)
* Runtime: delete BigStringReader, one should use UInt8ArrayReader instead
* Runtime: less conversion during un-marshalling (#1889)
* Runtime: use TextEncoder/TextDecoder for utf8-utf16 conversions
* Runtime/wasm: implement BLAKE2b primitives for Wasm (#1873)
* Runtime/wasm: support jsoo_env and keep track of backtrace status (#1881)
* Runtime/wasm: support unmarshaling compressed data (#1898)
* Runtime/wasm: make resuming a continuation more efficient in Wasm (#1892)
* Runtime/wasm: use imported string constants for JavaScript strings (#2022)
* Runtime/wasm: use DataView primitives to implement bigarrays (#1979)
* Compiler: improve performance of Javascript linking
* Compiler: remove empty blocks (#1934)
* Ppx: explicitly disallow polymorphic method (#1897)
* Ppx: allow "function" in object literals (#1897)
* Lib: add Dom_html.window.matchMedia & Dom_html.mediaQueryList (#2017)
* Lib: make the Wasm version of Json.output work with native ints and JavaScript objects (#1872)
* Compiler: add the `--empty-sourcemap` flag
* Compiler: faster compilation by stopping sooner when optimizations become unproductive (#1939)
* Compiler: improve debug/sourcemap location of closures (#1947)
* Compiler: improve tailcall optimization (#1943)
* Compiler: improve deadcode optimization (#1963, #1962, #1967)
* Compiler: improve coloring optimization (#1971, #1984, #1986, #1989)
* Compiler: faster constant sharing (#1988)
* Compiler: faster wat output (#1992)
* Compiler: faster js code generation (#1985)
* Compiler: more efficient code generation from bytecode (#1972)
* Runtime: use Dataview to convert between floats and bit representation
* Compiler: speed-up compilation by improving the scheduling of optimization passes (#1962, #2001, #2012, #2027)
* Compiler: deadcode elimination of cyclic values (#1978)
* Compiler: directly write Wasm binary modules (#2000, #2003)
* Compiler: rewrote inlining pass (#1935, #2018, #2027)
* Compiler/wasm: optimize integer operations (#2032)
* Compiler/wasm: use type analysis to remove some unnecessary uses of JavasScript strict equality (#2040)
* Compiler/wasm: use more precise environment types (#2041)
* Compiler/wasm: optimize calls to statically known function (#2044)
* Compiler: Propagate arity between compilation units (#1594)

## Bug fixes
* Compiler: fix stack overflow issues with double translation (#1869)
* Compiler: minifier fix (#1867)
* Compiler: fix assert failure with double translation (#1870)
* Compiler: fix path rewriting of Wasm source maps (#1882)
* Compiler: fix global dead code in presence of dead tailcall (#2010)
* Compiler/wasm: fix bound check for empty float array (#1904)
* Lib: fix Dom_html.Keyboard_code.of_event (#1878)
* Runtime: fix path normalization (#1848)
* Runtime: fix reading from the pseudo-filesystem (#1859)
* Runtime: fix initialization of standard streams under Windows (#1849)
* Runtime: fix Int64.of_string overflow check (#1874)
* Runtime: fix caml_string_concat when not using JS strings (#1874)
* Runtime: consistent bigarray hashing across all architectures (#1977)
* Runtime: fix caml_utf8_of_utf16 bug in high surrogate case (#2008)
* Runtime/wasm/js: fix method lookup (#2034, #2038, #2039)
* Tools: fix jsoo_mktop and jsoo_mkcmis (#1877)
* Toplevel: fix for when use-js-strings is disabled (#1997)

# 6.0.1 (2025-02-07) - Lille

## Features/Changes
* Compiler/Runtime: Make resuming a continuation more efficient in js (#1765)
* Compiler/Runtime: Effects: add an optional feature of "dynamic switching" between CPS
  and direct style, resulting in better performance when
  no effect handler is installed
* Compiler: Merged Wasm_of_ocaml (#1724)
* Lib: fix the type of some DOM properties and methods (#1747)
* Lib: removed no longer relevant Js.optdef type annotations (#1769)
* Lib: Add other textMetrics property (#1784)
* Lib: rename Firebug to Console (#1802)
* Test: use dune test stanzas (#1631)
* Test: run wasm tests on windows
* Misc: drop support for IE
* Misc: move tests to OCaml 5.3
* Misc: import many test from the OCaml codebase
* Runtime: support for float16 bigarrays
* Runtime: support more Unix functions (#1823)
* Runtime: various filesystem fixes (#1825)

## Bug fixes
* Compiler: Fix small bug in global data flow analysis (#1768)
* Runtime: no longer leak channels
* Runtime: Fix Marshal.to_buffer (#1798)
* Runtime: unmarshalling objects should refresh its id
* Runtime: check size upper bound during array creation
* Runtime: return sys_error when reading from a closed channels
* Runtime: fix parsing of hex-float with very large exponent
* Runtime: make sure [n / 0L] is not optimized away by DCE
* Runtime: fix Unix.LargeFile.stat/lstat
* Runtime: fix stat/lstat times
* Runtime: fix reading from stdin in an interactive nodejs

# 5.9.1 (02-12-2024) - Lille

## Features/Changes
* Compiler: add mechanism to deprecate runtime promitives
* Runtime: re-introduce caml_new_string, marked as deprecated

# 5.9.0 (2024-11-22) - Lille

## Features/Changes
* Misc: update testsuite to OCaml 5.2
* Misc: CI uses opam.2.2 and no longer use sunset repo
* Misc: yojson is no longer optional
* Misc: reduce the diff with the wasm_of_ocaml fork
* Misc: finalize support for OCaml 5.3
* Compiler: speedup global_flow/global_deadcode pass on large bytecode
* Compiler: improved global dead code elimination (#2206)
* Compiler: speedup json parsing, relying on Yojson.Raw (#1640)
* Compiler: Decode sourcemap mappings only when necessary (#1664)
* Compiler: mark [TextEncoder] as reserved
* Compiler: add support for the Wasm backend in parts of the pipeline, in
  prevision for the merge of wasm_of_ocaml
* Compiler: introduce a Targetint module
  that follows the semantic of the backend (js or wasm)
* Compiler: warn on joo_global_object
* Compiler: revisit static env handling (#1708)
* Compiler: Emit index source_map to avoid changing mappings (#1714, #1715)
* Compiler: improved source map generation (#1716)
* Runtime: change Sys.os_type on windows (Cygwin -> Win32)
* Runtime: backtraces are really expensive, they need to be explicitly
  requested at compile time (--enable with-js-error) or at startup (OCAMLRUNPARAM=b=1)
* Runtime: allow dynlink of precompiled js with separate compilation (#1676)
* Runtime: reimplement the runtime of weak and ephemeron (#1707)
* Lib: Modify Typed_array API for compatibility with WebAssembly
* Lib: add details element and toggle event (#1728)
* Lib: implement popover API (#1734)
* Toplevel: no longer set globals for toplevel initialization
* Runtime: precompute constants used in `caml_lxm_next` (#1730)
* Runtime: cleanup runtime

## Bug fixes
* Runtime: fix parsing of unsigned integers (0u2147483648) (#1633, #1666)
* Runtime: fix incorrect pos_in after unmarshalling
* Runtime: make float_of_string stricter (#1609)
* Toplevel: fix missing primitives with separate compilation
* Compiler: fix link of packed modules with separate compilation
* Compiler: Fixed the static evaluation of some equalities (#1659)
* Compiler: fix global analysis bug (subsumes #1556)

# 5.8.2 (2024-05-26) - Luc

## Bug fixes
* Compiler: fix variable renaming for property binding and assignment target (part 2)

# 5.8.1 (2024-05-05) - Lille

## Features/Changes

* Library: new Typed_array.Bytes module.

## Bug fixes

* Compiler: fix #1509

# 5.8.0 (2024-04-20) - Lille

## Features/Changes
* Compiler: es6 now generate consise body
* Compiler: codegen: optimize Offset_ref for negative offsets
* Compiler: codegen: change argument passing of back edges.
* Compiler: codegen: use Array destruction to assign args of back
  edges with es6.
* Compiler: codegen: specialize string equality
* Compiler: codegen: more specialization for %int_add, %int_sub
* Compiler: recognize and optimize String.concat
* Compiler: more inlining - duplicate small function.
* Compiler: Make it possible to link runtime JavaScript file
  together with OCaml libraries #1509
* Compiler: initial support for OCaml 5.3
* Runtime: abort instead of exit when calling unimplemented
  js primitives in bytecode/native. It should help if one tries
  to understand the source of the call with gdb (see #677)
* Runtime: re-enable marshalling of floats, disabled in jsoo 2.0
* Runtime: new runtime api for channels


## Bug fixes

* Compiler: fix variable renaming for property binding and assignment target
* Compiler: fix separate compilation of toplevels (broken since 5.7.0)
* Compiler: fix assertion while checking stack compatibility (#1600)

# 5.7.2 (2024-04-03) - Lille

## Bug fixes
* Runtime: add missing primitives for ocaml 5.2.0~beta1

# 5.7.1 (2024-03-05) - Lille

## Features/Changes
* Compiler: only flush the necessary env for closures (#1568)
* Library: dialog element support

## Bug fixes
* Compiler: fix --enable=vardecl
* Compiler: fix parallel renaming (bug introduced in #1567)
* Lib: fix paragraph construction and coercion
* Runtime: reduce memory leak with channels (#1581)

# 5.7.0 (2024-02-16) - Lille

## Features/Changes
* Mics: fix support for OCaml 5.2
* Compiler: no longer rely on IIFE for scoping variable inside loops
* Compiler: avoid parsing bytecode sections twice, jsoo counter part of ocaml#12599
* Lib: add ellipse to canvasRenderingContext2D (@FayCarsons, #1555)

## Bug fixes
* Compiler: fix global dead code elimination in a toplevel context
* Compiler: fix exit-loop-early optim in presence of closure (#1561)
* Compiler: remove quadratic behavior in generate.ml (#1531, #1567)

# 5.6.0 (2024-01-02) - Lille

## Features/Changes
* Compiler: try to preserve clorures ordering between ml and js
* Compiler: js-parser accept for await

## Bug fixes
* Compiler: js-parser now accept all the line terminators defined in the spec
* Compiler: js-parser: fix support for LHS assignment target
* Compiler: js-parser: fix parser of default export
* Compiler: js-parser: allow 'as' as ident
* Compiler: js-parser: fix for-in rewriting
* Compiler: js-parser: fix yield pretty print
* Compiler: js-parser: fix async arrow function
* Compiler: js-parser: fix class printing
* Compiler: js-parser: fix #privateName

# 5.5.2 (2023-12-01) - Lille

## Features/Changes
* Compiler: global dead code elimination (Micah Cantor, #1503)
* Compiler: change control-flow compilation strategy (#1496)
* Compiler: loop no longer absorb the whole continuation
* Compiler: Dead code elimination of unused references (#2076)
* Compiler: reduce memory consumption (#1516)
* Compiler: support for import and export construct in the js parser/printer
* Lib: add download attribute to anchor element
* Misc: switch CI to OCaml 5.1
* Misc: preliminary support for OCaml 5.2
* Misc: support for OCaml 5.1.1

## Bug fixes
* Runtime: fix Dom_html.onIE (#1493)
* Runtime: add conversion functions + strict equality for compatibility with Wasm_of_ocaml (#1492)
* Runtime: Dynlink should be able to find symbols in jsoo_runtime #1517
* Runtime: fix Unix.lstat, Unix.LargeFile.lstat (#1519)
* Compiler: fix global flow analysis (#1494)
* Compiler: fix js parser/printer wrt async functions (#1515)
* Compiler: fix free variables pass wrt parameters' default value (#1521)
* Compiler: fix free variables for classes
* Compiler: fix internal invariant (continuation)
* Compiler: fix variable renaming for let, const and classes
* Lib: Url.Current.set_fragment need not any urlencode (#1497)

# 5.4.0 (2023-07-06) - Lille

## Bug fixes
* Runtime: Fix recursive modules on ocaml < 4.13 (#1485)
* Runtime: fix hashing of NaN (#1475)
* Runtime: float rounding should resolve tie away from zero (#1475)
* Runtime: fix Gc.stat, Gc.quick_stat, Gc.get (#1475)
* Compiler: fix some miscompilation, probably introduced in jsoo 5.0.0,
  revealed by OCaml 5.0

# 5.3.0 (2023-06-21) - Lille
## Features/Changes
* Misc: Bump magic number for ocaml 5.1
* Misc: changes to stay compatible with the next version of ppx_expect
* Runtime: support conversion of Uint8ClampedArray typed arrays to bigarrays (#1472)

## Bug fixes
* Compiler: fix location for parsing errors when last token is a virtual semicolon
* Compiler: fix variable renaming with nested const/let decl with identical names
* Compiler: fix variable renaming inside js method
* Compiler: consise body should allow any expression but object literals
* Compiler: preserve [new] without arguments [new C] (vs [new C()]
* Compiler: remove invalid rewriting of js (#1471, #1469)
* Runtime: fix int32 values returned from bigarrays when wrapping Uint32Array objects (#1472)

# 5.2.0 (2023-04-28) - Lille
## Features/Changes
* Compiler: jsoo link archive with -a (#1428)

## Bug fixes
* Compiler: put custom header at the top of the output file (fix #1441)
* Compiler (js parser): fix parsing of js labels (fix #1440)
* Compiler: fix simplification of js with let and const
* Compiler: reduce memory consumption when parsing js
* Compiler: parsing js can return a list of token, the list was sometime incorrect
* Sourcemap: stop producing sourcemaps mappings with negative lines or columns
* Runtime: fix marshalling with sharing and string (use-js-string)

# 5.1.1 (2023-03-15) - Lille
## Bug fixes
* Compiler: fix jsoo link in presence of --disable use-js-string (#1430)

# 5.1.0 (2023-03-07) - Otari
## Features/Changes
* Lib: Added support for KeyboardEvent.getModifierState
* Misc: bump min ocaml version to 4.08
* Misc: remove some old runtime files to support some external libs
* Misc: switch to dune 3.7
* Effects: partial CPS transformation, resulting in much better performances, lower compilation time and smaller generated code
* Compiler: separate compilation can now drops unused units when linking (similar to ocamlc). (#1378)
* Compiler: specialize string to js-string conversion for all valid utf8 strings (previously just ascii)
* Compiler: JavaScript files generated by `js_of_ocaml` are now UTF-8 encoded.
* Compiler: use identifier for object literals when possible
* Compiler: Cache function arity (the length prop of a function is slow with v8)
* Compiler: The js lexer is now utf8 aware, recognize and emit utf8 ident
* Compiler: Update the js lexer with new number literal syntax
* Compiler: update js parser to support most es6 feature (#1391)
* Compiler: stop parsing the builtin js runtime if not necessary
* Compiler: improve js pretty printer (#1405)
* Compiler: improve debug location and speedup compilation (#1407)
* Compiler: improve analysis for more direct call (#1397)
* Compiler: change memory representation of OCaml strings to use js ones.
* Toplevel: Enable separate compilation of toplevels
* Runtime: js backtrace recording controled by OCAMLRUNPARAM
* Runtime: support for zstd decompression of marshalled data (ocaml.5.1) (#12006)
* Runtime: stub out custom runtime events symbols for OCaml 5.1 (#1414)

## Bug fixes
* Effects: fix Js.export and Js.export_all to work with functions (#1417,#1377)
* Sourcemap: fix incorrect sourcemap with separate compilation
* Compiler: fix control flow analysis; some annotations were wrong in the runtime
* Compiler: js backtrace recording respected in the js runtime and when using effects
* Compiler: no longer fail on invalid source file (when the file is a directory)
* Runtime: fix the compilation of some mutually recursive functions

# 5.0.1 (2022-12-20) - Lille
## Features/Changes

## Bug fixes
Runtime: fix caml_read_file_content

# 5.0.0 (2022-12-20) - Lille
## Features/Changes
* Compiler: add support for effect handlers (--enable=effects)
* Compiler: small refactoring in code generation
* Compiler: check build info compatibility when linking js file.
* Compiler: rewrite control flow compilation logic
* Misc: fix and update benchmarks
* Misc: upgrade CI
* Toplevel: recover more names when generating code during toplevel evaluation
* Runtime: wrapping exception or not is now controled in the runtime.

## Bug fixes
* Runime: Gc.finalise_last should not be eliminated
* Tyxml: reactive dom needed a fix after #1268 (#1353)
* Toplevel: Make sure the toplevel uses the correct memory representaion for strings
* Compiler: fix minifier, missing constraint on try-catch blocks.
* Compiler: Miscompilation of code involving references and exceptions (#1354, #1356)

# 4.1.0 (2022-11-15) - Lille
## Features/Changes
* Compiler: initial support for OCaml 5 (#1265,#1303)
* Compiler: bump magic number to match the 5.0.0~alpha0 release (#1288)
* Compiler: complain when runtime and compiler built-in primitives disagree (#1312)
* Compiler: more efficient implementation of Js_traverse.freevar
* Compiler: more efficient implementation of Js_traverse.rename_variable
* Compiler: --linkall now export all compilation units in addition to primitives (#1324)
* Compiler: improve --dynlink, one no longer need to pass --toplevel to use Dynlink (#1324)
* Compiler: toplevel runtime files "+toplevel.js" and "+dynlink.js" are added automatically (#1324)
* Misc: switch to cmdliner.1.1.0
* Misc: remove old binaries jsoo_link, jsoo_fs
* Misc: remove uchar dep
* Misc: use 4.14 in the CI
* Misc: switch to dune 3
* Lib: add missing options for Intl.DateTimeFormat
* Lib: add missing options for Intl.NumberFormat
* Lib: wheel event binding
* Lib: add normalize in js_string (ES6)
* Lib: more complete transition event bindings
* Lib: remove support for old browser-specific transition events
* Runtime: Implement weak semantic for weak and ephemeron (#1268)
* Runtime: Implement Gc.finalise_last
* Runtime: Implement buffer for in_channels
* Runtime: add support for unix_opendir, unix_readdir, unix_closedir, win_findfirst, win_findnext, win_findclose
* Runtime: Dont use require when target-env is browser
* Runtime: Implements Parsing.set_trace (#1308)
* Runtime: ocaml string are represented as javascript ones.
* Test: track external used in the stdlib and unix

## Bug fixes
* Compiler: fix quadratic behavior of dominance frontier (fix #1300)
* Compiler: fix rewriter bug in share_constant (fix #1247)
* Compiler: fix miscompilation of mutually recursive functions in loop (#1321)
* Compiler: fix bug while minifying/renaming try-catch blocks
* Compiler: no dead code elimination for caml_js_get
* Runtime: fix ocamlyacc parse engine (#1307)
* Runtime: fix Out_channel.is_buffered, set_buffered
* Runtime: fix format wrt alternative
* Runtime: fix Digest.channel
* Runtime: sync channel seek / pos with the native runtime
* Misc: fix installation with dune 3 without opam
* Node: Only write small chunks to stdout/stderr so they flush
* Deriving: fix for nested polymorphic variants

# 4.0.0 (2021-01-24) - Lille
## Features/Changes
* Compiler: add --target-env flag, for JS runtime specific compilation targets (#1160).
* Compiler: static evaluation of backend_type (#1166)
* Compiler: speedup emitting js files (#1174)
* Compiler: simplify (a | 0) >>> 0 into (a >>> 0) (#1177)
* Compiler: improve static evaluation of cond (#1178)
* Compiler: be more consistent dealing with js vs ocaml strings (#984)
* Compiler: Compiler: add BigInt to provided symbols (fix #1168) (#1191)
* Compiler: use globalThis, drop joo_global_object #1193
* Compiler: new -Werror flag to turn wanrings into errors (#1222)
* Compiler: make the inlining less agressive, reduce size, improve pref (#1220)
* Compiler: rename internal library js_of_ocaml-compiler.runtime to js_of_ocaml-compiler.runtime-files
* Lib: new runtime library to improve compatibility with Brr and gen_js_api
* Lib: add messageEvent to Dom_html (#1164)
* Lib: add PerformanceObserver API (#1164)
* Lib: add CSSStyleDeclaration.{setProperty, getPropertyValue, getPropertyPriority, removeProperty} (#1170)
* Lib: make window.{inner,outer}{Width,Height} non-optional
* Lib: introduce Js_of_ocaml.Js_error module, deprecate Js_of_ocaml.Js.Error exception.
* Lib: add deprecation warning for deprecated code
* PPX: json can now be derived for mutable records (#1184)
* Runtime: use crypto.getRandomValues when available (#1209)
* Misc: move js_of_ocaml-ocamlbuild out to its own repo
* Misc: add support for OCaml 4.14 (#1173)

## Bug fixes
* Compiler: fix sourcemap warning for empty cma (#1169)
* Compiler: Strengthen bound checks. (#1172)
* Compiler: fix `--wrap-with-fun` under node (#653, #1171)
* Compiler: fix parsing of annotaions in js stubs (#1212, fix #1213)
* Ppx: allow apostrophe in lident (fix #1183) (#1192)
* Runtime: fix float parsing in hexadecimal form
* Runtime: fix implementation of caml_js_instanceof
* Graphics: fix mouse_{x,y} (#1206)

# 3.11.0 (2021-10-06) - Lille

## Features/Changes
* Compiler: setting tc_depth to 0 remove direct call from the tc optimization.
* Lib: add hidden, onfullscreenchange and onwebkitfullscreenchange to document
* Runtime: fixes for Windows, all tests pass
* Runtime: make all windows drive available on nodejs.
* Runtime: add support for Sys.mkdir and Sys.rmdir
* Runtime: make stdin work on nodejs
* Runtime: add support for Unix(stat,lstat,mkdir,rmdir,symlink,readlink,unlink,getuid) on nodejs.
* Runtime: add caml_raise_with_args

## Bug fixes
* Compiler: fix toplevel generation (#1129, #1130, #1131)
* Compiler: fix predefined exn id with separate compilation
* Compiler: js stubs without 'Provides' should still allow 'Require'
* Runtime: fix handling of uncaugh exceptions
* Runtime: fix error handling of Sys.readdir
* Dune: make git version lookup more resilient

# 3.10.0 (2021-08-30) - Lille
## Features/Changes
* Compiler: add support for OCaml 4.13
* Compiler: new tool to check for missing primitives
* Compiler: drop support for OCaml 4.03 and bellow
* Lib: add offsetX and offsetY to Dom_html.mouseEvent
* Lib: add innerText property for Dom_html
* Runtime: add dummy implementation for many dummy primitives
* Runtime: add runtime for new float operation in 4.13 #1113 (by pmwhite)

## Misc
* manual/rev_bindings.wiki: fix compilation error

# 3.9.1 (2021-02-17) - Lille
## Features/Changes
* Runtime: add missing primitives for OCaml 4.12

## Bug fixes
* Compiler: fix handling of offsetclosure with 4.12
* Compiler: fix ocaml_version parsing to support tilde

# 3.9.0 (2021-02-15) - Lille
## Features/Changes
* Lib: add clipboardEvent to Dom_html and update appropriate function signatures
* Lib: add submitEvent to Dom_html and update appropriate function signatures
* Compiler: complete support for OCaml 4.12
* Lib: expose API to attached and retrieve js errors to/from ocaml exceptions
* Lib: intersection observer API fixes

## Bug fixes
* Compiler: fix a segmentation fault when `flat-float-array` mode is disabled.

# 3.8.0 (2020-10-21) - London
## Features/Changes
* compiler, ppx_js, ppx_deriving_json: port PPX's to ppxlib (#1041)

# 3.7.1 (2020-09-29) - London
## Features/Changes
* lib: Add Navigator.{vendor,maxTouchPoints} (#1062)
* lib: adds the intersection observer API (#1063)

## Bug fixes
* compiler: revert of "Eliminate allocation of dummy function #1013"
* compiler: fix for #1051 (#1052), Ensure the overflow warning is always displayed
* runtime: add missing primitives for 4.11
* lib: Fix resize-observer (#1058)

# 3.7.0 (2020-08-05) - Lille
## Features/Changes
* Runtime: allow one to override xmlHttpRequest.create (#1002)
* Runtime: Change the semantic of MlBytes.toString, introduce MlBytes.toUtf16
* Compiler: initial support for OCaml 4.11
* Compiler: initial support for OCaml 4.12
* Compiler: improve the javascript parser by relying on menhir
  incremental api.
* Compiler: Eliminate allocation of dummy function #1013

## Bug fixes
* Compiler: fix code generation for recursive function under for-loops (#1009)
* Compiler: the jsoo compiler compiled to javascript was not behaving correctly
            when parsing constant in the from the bytecode
* Compiler: make sure inline doesn't loop indefinitly (#1043)
* Compiler: fix bug generating invalid javascript for if-then construct (#1046)
* Compiler: do not use polymorphic comparison when joining float values (#1048)
* Lib: Rename msg to message in Worker (#1037)
* Lib: fix graphics_js when build with separate compilation (#1029)

# 3.6.0 (2020-04-26) - Lille
## Features/Changes
* Compiler: change compilation scheme for branches (#948)
* Compiler: Introduce sub-command: link, build-runtime, build-fs (#987)
* Compiler: embed javascript runtime in the compiler (#978)
* Compiler: refactor javascript lexer/parser, add tests (#986)
* Runtime: clean runtime for string vs bytes
* Runtime: remove many old polyfill
* Runtime: add unix_isatty
* Runtime: optimize caml_call_gen (#996)
* Runtime: change representation of int64  (#905)
* Runtime: improve node.js backend for Sys.command (#979)
* Runtime: add javascript runtime for Str (#998)
* Lib: add closest method to element (#930)
* Lib: add several methods and functions to Typed_array (#970)
* Ppx: ppx_js behave better with merlin (#933)
* Misc: Cleanup Meta files (e.g. `js_of_ocaml.tyxml` is no longer valid library name)
* Misc: switch to ocamlformat.0.14

## Bug fixes
* Compiler: fix vardecl optim (#946)
* Compiler: restore optimization when generating if statements
* Compiler: fix javascript parser in the presence of line directives (#980)
* Runtime: Catch nodejs errors and re-raise them as Sys_error
* Runtime: fix caml_parse_sign_and_base and unsigned syntax
* Runtime: fix caml_js_wrap_meth_callback_strict (#996)
* Runtime: fix over-application of javascript callback (#996)
* Runtime: fix partial-application of javascript callback (#996)
* Runtime: fic caml_js_wrap_meth_callback_unsafe (#996)
* Lib: Fix the type of blur and focus event to be focusEvent (#929)

# 3.5.2 (2019-12-14) - Hong Kong
## Features/Changes
* Misc: support for ocaml 4.10
* Misc: ppx_deriving_json uses ppxlib >= 0.9

## Bug fixes
* Runtime: fix pseudo fs initialization (#931)

# 3.5.1 (2019-11-16) - Hong Kong
## Features/Changes

## Bug fixes
* Runtime: fix poly compare with null and undefined (#920)
* Lib: Deriving Json does not export an [import] unit
* Dynlink/toplevel: export all units when no export file is specified (#921)
* Ppx: ppx_deriving_json should allow [%to_json: t] syntax

# 3.5.0 (2019-11-10) - Hong Kong
## Features/Changes
* Compiler: Improve testing of the compiler (Ty Overby)
* Compiler: Add several macros for making the runtime easier to maintain (#771) (Ty Overby)
* Compiler: Allow to emit one javascript per compilation unit (#783)
* Compiler: refactoring (#781, #782, #787, #795, #802)
* Compiler: more source map location for the javascript runtime (#795)
* Compiler: tune variable naming (#838)
* Compiler: Work around num lib incompatibility
* Compiler: escape '</' in strings (#899)
* Compiler: speedup toplevel creation
* Runtime: support sharing when marshaling (#814)
* Runtime: add caml_obj_with_tag
* Runtime: support marshaling custom block
* Runtime: complete rewrite of bigarray
* Runtime: complete num implementation
* Runtime: add caml_ba_hash
* Runtime: rewrite polymorphic compare
* Ppx: switch ppx rewriter to the OCaml 4.08 ast
* Misc: Improve CI speed
* Misc: remove ppx_deriving dependency
* Misc: remove cppo dependency
* Misc: remove ppx_tools_versioned dependency in ppx_deriving_json
* Misc: support for ocaml 4.09
* Misc: switch to ocamlformat.0.12
* Misc: many more tests
* Misc: new jsoo_fs tool to embed files in a jsoo pseudo fs.
* Lib: Use expect tests
* Lib: Add support for 'addEventListener' with options (#807)
* Lib: Change api of [Lwt_js_events.async] (#862)
* Lib: Change api of responseText in xmlhttprequest (#863)
* Lib: add resizeObserver bindings
* Lib: Added support for custom events (#877)
* Lib: Added support for focus events (#885)
* Lib: Added `passive` option support for `Lwt_js_events` module
* Lib: Added bindings for pointer events (#894)

## Bug fixes
* Compiler: don't generate source if no-source-map passed (#780)
* Compiler: Fix compilation of [Array.set] to return [unit]/0 (#792)
* Compiler: Fix assertion failure (#828)
* Compiler: Fix compilation of exception handlers (#830)
* Compiler: Fix static evaluation of caml_equal (#906)
* Misc: Fix install on windows (#794)
* Lib: Fix Dom_svg.createForeignObject (#756)
* Runtime: Fix caml_obj_tag, causing miscompilation with lazy value (#772)
* Runtime: Fix caml_ml_seek_out, caml_ml_pos_out (#779) (Shachar Itzhaky)
* Runtime: caml_parse_sign_and_base to support unsigned syntax (#791) (Shachar Itzhaky)
* Runtime: fix encoding when printing to stdout (#800)
* Runtime: Handle browserfs in fs_node detection logic (#831)
* Runtime: fix Obj.tag (#832)
* Runtime: fix marshalling of custom blocks (#861)
* Runtime: fix frexp
* Runtime: fix float printing with "%f" and large floats

# 3.4.0 (2019-04-17) - Hong Kong
## Features/Changes
* Compiler: Support reproducible builds by using BUILD_PATH_PREFIX_MAP
* Compiler: Remove support for ocaml < 4.02.3
* Compiler: use paths from debug info when looking to looking cmis to embed
* Compiler: refactoring, renaming
* Compiler: make float literals look like float (#767)
* Misc: use ocamlformat
* Misc: dunify the build of the toplevel
* Misc: support for OCaml 4.08
* Lib: wrap js_of_ocaml-lwt, js_of_ocaml-tyxml, js_of_ocaml-toplevel, js_of_ocaml-compiler
* Runtime: don't use deprecated [new Buffer] on nodejs (#726)

## Bug fixes
* Compiler: fix compilation of empty cma
* Compiler: fix js parser with keyword as ident
* Compiler, Runtime: make --setenv work with Sys.getenv_opt
* Compiler: fix miscompilation of Obj.is_int with a match expression
* Compiler: fix quadratic behaviour in findlib.ml
* Compiler: prevent addition with a positively-signed number from being coalesced… (#764)
* Compiler: Fix: static eval of String.get (#770)
* Runtime: make obj_dup work on string/bytes
* Runtime: fix bad hash function on int64
* Runtime: avoid redundant conversion to string in fs_fake.js

# 3.3.0 (2018-11-26) - Hong Kong
## Features/Changes
* Toplevel: [--toplevel] is now taken account when compilig cmo and cma.
* Lib: make [Js.Unsafe.any] be [Js.Unsafe.top Js.t]
* Lib: Improve generation of dummy stubs (#700)
* Lib: Deprecate non namespaced module access
* Lib: Upgrade to Tyxml 4.3.0
* Misc: switch to dune
* Misc: remove camlp4 support

## Bug fixes
* Toplevel: Fix dynlink of precompiled javascript files.
* Lib: Fix encoding in Sys.set_channel_flusher (fix #686)
* Runtime: fix the type of dataTransfer##.types
* Runtime: add dummy implementation for caml_restore_raw_backtrace

# 3.2.1 (2018-07-26) - Bari
## Bug fixes
* Misc: Fix the dependencies of the Lwt logger
* Runtime: fix semantic of bigstring_destroy_stub

# 3.2.0 (2018-06-10) - Bergen
## Features/Changes
* Runime: improve stacktraces.
* Ppx: ppx uses the OCaml 4.06 ast.
* Misc: support for OCaml 4.07
* Misc: start leveraging safe-string.
* Lib: add support for Internationalization API.
* Lib: Added media events support.

## Bug fixes
* Runtime: int_of_string accepts leading '+'
* Runtime: fix polymorphic & hash compare on custom non-ocaml values.
* Runtime: fix string encoding when writing to channels.
* Runtime: improve mode js detection wrt filesystem.

# 3.1.0 (2018-02-15) - Hong Kong
## Features/Changes
* Lib: add missing File.blob constructor (fix #630)
* Runtime: hash support for custom blocks
* Runtime: weak.js loaded by default
* Compiler: compile an OCaml program into a named javascript function (fix #599)
* Misc: move ppx_deriving_json in its own opam package (Rudi Grinberg)
* Compiler: static eval of float negation
* Compiler: improve constant sharing.
* Ppx: add support for writeonly_prop and optdef_prop in object literal.

## Bug fixes
* Compiler: fix code generation of unary ops (missing space).
* Compiler: fix static eval of conditions (fix #616)
* Compiler: fix code generation for OCaml GPR#1568
* Runtime: fix bug found using the closure compiler (#644)

# 3.0.2 (2017-12-01) - Strasbourg
## Features/Changes
* Runtime: support for latest core_kernel

## Bug fixes
* Runtime: fix sys_chdir
* Runtime: fix fs support on windows
* Ppx: fix ppx_deriving_json for ocaml 4.05

# 3.0.1 (2017-11-04) - London
## Features/Changes
* Lib: add Jstable.remove (Cedric Cellier)
* Build: use recent version of jbuilder (># 1.0+beta12)

## Bug fixes
* Runtime: fix Sys.file_exists for the in-memory filesystem.
* Runtime: implement missing primitives: caml_nativeint_bswap, caml_floatarray_*,
  caml_ba_change_layout
* Runtime: few other bugfixes.
* Compiler: fix compat with OCaml 4.06

# 3.0.0 (2017-06-23) - Hong Kong

## Features/Changes
* Misc: switch to ppx instead of camlp4
* Misc: always install deriving_json
* Misc: remove support for async_kernel, bin_prot
* Misc: remove support for ppx_driver
* Misc: split js_of_ocaml in multiple packages
* Misc: switch to jbuilder
* Misc: new pseudo filesystem support with better node support
* Compiler: sourcemap support is now optional
* Compiler: no more strong dep on yojson, b64, menhir, ocamllex
* Compiler: improve separate compilation workflow
* Runtime: add support for weakdef
* Syntaxes: add expect tests
* Syntaxes: switch to ocaml-migrate-parsetree and ppx_tools_versioned
* Lib: Add primitives in [Js.Unsafe]
* Lib: remove keycode module, replaced by Dom_html.Keyboard_code
* Lib: XmlHttpRequest, API change for perform functions.

## Bug fixes
* Runtime: fix many stubs
* Lib: fix many signatures
* Compiler: fix performance of compilation passes (simpl,clean)
* Compiler: fix compat with OCaml 4.06
* Toplevel: flush channels after execution.
* Toplevel: fix toplevel generation when using -export-unit

# 2.8.4 (2016-12-21)

## Features/Changes
* Compiler: new jsoo_link binary to link multiple javascript files
  together and merging sourcemaps.
* Toplevel: improve generation of toplevels, one can now pass a
  an export file containing units to export. (see jsoo_listunits)
* Lib: Provide a Js_of_ocaml (namespace) module to ease transition
  with future version of js_of_ocaml

## Bug fixes
* Compiler: fix separate compilation when facing empty unit inside a library
* Runtime:  fix many javascript stubs
* Syntac: fix ppx deriving json

# 2.8.3 (2016-11-04)

## Features/Changes
* Runtime: complete support for 4.04

## Bug fixes
* Compiler: fix order of javascript files
* Compiler: fix Javascript lexer (newline inside strings)
* Compiler: fix bug in closure generation
* Compiler: fix regression in closure generation (introduced in 2.8) (#531)
* Compiler: fix code generation when static evaluation is disabled

# 2.8.2 (2016-09-10)

## Features/Changes
* Lib: add Dom_html.Keyboard_code & Dom_html.Keyboard_key (Corwin de Boor)
* Misc: update lib and runtime to work better with non browser environment
* Misc: initial support for 4.04

## Bug fixes
* Compiler: fix js output for x - -1
* Compiler: fix parsing of annotations in the runtime
* Compiler: fix javascript minifier
* Compiler: various fixes for separate compilation.

# 2.8.1 (2016-07-01)

## Features/Changes
* Compiler: reduce memory usage for shortvar
* Lib: Add optional `prefix` arg to Jsonp.call
* Ppx: add ppx_driver compatibility

## Bug fixes
* Lib: fix Js.object_keys, Js.export
* Lib: Async, do not ignore unhandled exceptions

# 2.8 (2016-06-16)
## Features/Changes
* Compiler: allow dynlink of precompiled javascript file
* Compiler: Improve tailcall optimization
* Compiler: Improve pretty mode
* Compiler: More inlining and static evaluation
* Compiler: Better source map support, to leverage resolve_variable_names
  in chrome DevTools
* Compiler: preserve as much as possible the initial OCaml variable names
* Lib: synchronize with tyxml 4.0.0
* Lib: convert string/bigstring to/from typed_array
* Lib: add Tyxml_js.Register API.
* Lib: Support for Core_kernel and Async_kernel (32bit only).
* Lib: Mutation observer.
* Runtime: bigstring, caml_int32_bits_of_float, ..
* Runtime: better nodejs integration

## Misc
* Support for OCaml 4.03
* Toplevel with ppx syntax

## Bug fixes
* Compiler: Fix float printing
* Compiler: fix separate compilation

# 2.7 (2016-01-25)

## Features/Changes
* Syntax: ppx_deriving
* Compiler: Add custom_header ability to jsoo generate file (Edgar Aroutiounian)
* Compiler: Bytecode parsing, improved performance
* Lib: add geolocation API (Stéphane Legrand)
* Lib: add Mutation observers API (Stéphane Legrand)
* Lib: add Jstable module (Drup)
* Lib: add WebWorker API (Grégoire Henry)
* Lib: Allow to customize 'in_channel' with specific 'refiller' (Grégoire Henry)
* Lib: Synchronized tyxml 3.6.0

## BugFixes
* Compiler: Fix compilation of the [match with exception] construct
* Compiler: fix compat with the upcoming ocaml 4.03
* Lib: Tyxml_js, discrepancy between Firefox and Chromium
* Lib: various small fixes
* Runtime: Fix Big_int.square_big_int
* Runtime: graphics, fix draw_image with transparent pixel
* Ppx: fix for merlin

# 2.6 (2015-07-15)

## Features/Changes
* Compiler: Findlib is optional
* Compiler: improvement of sourcemap support (ie: inlinned sourcemap)
* Compiler: Support for separate compilation (compile cm{o,a} -> js)
* Compiler: more inlining
* Syntax: new ppx syntax
* Syntax: js object literal (camlp4 + ppx)
* Runtime: support for Dynlink
* Runtime: Support for upcoming release of Bin_prot, Core_kernel, Async_kernel
* Lib: add requestAnimationFrame
* Lib: complete Js.Math
* Lib: complete xmlHttpRequest

## Misc
* Drop support for 3.12

## BugFixes
* Runtime: Fix caml_hash
* Lib: fix tyxml + svg
* Lib: various Api fixes

# 2.5 (2014-09-30)

## Features/Changes
* Compiler: SourceMap improvement
* Compiler: remove registration of unused named value (wrt runtime)
* Compiler: Smarter inlining, Constant sharing, Switch generation
* Lib: Dom binding: *AttributeNS, *AttributeNode*, borderRadius
* Runtime: improve performance of string, array allocation
* Misc: enable safestring for OCaml 4.02
* Commandline: switch to Cmdliner. Better -help + manpage

## BugFixes
* Compiler: workaround a bug in ocaml 4.02 wrt debug section.
* Compiler: bug when generating minified JavaScript.
* Runtime: fix Obj.tag
* Runtime: fix internalmod wrt ocaml4.02

# 2.4.1 (2014-08-28)

## BugFixes
* Compiler: restore compatibility with ocaml 4.02
* Runtime: fix caml_hash, Math.imul may give wrong results (#215)
* Lib: Graphics_js, update text drawing baseline
* Lib: Fix overuse of FormData in XmlHttpRequest (Tomohiro Matsuyama #214)

# 2.4 (2014-08-08)

## Features/Changes
* Runtime: support for num (Ryan Goulden)
* Lib: initial support for Dom_svg
* Lib: introduce Jsonp module
* Lib: introduce JSON object binding
* Lib: introduce DomContentLoaded
* lib: introduce eventSource
* Lib: introduce js_of_ocaml.toplevel package
* Lib: various improvement: textContent,outerHTML,unload event,css properties
* Lib: complete binding of Js.array
* Lib: change signature of Sys_js.register_autoload
* Lib: sync js_of_ocaml.tyxml with latest tyxml
* Tools: helpers to build toplevel: jsoo_mktop, jsoo_mkcmis

## BugFixes
* Compiler: generate js files with default permission, was 0o600
  (#182) (Daniel Bünzli)
* Syntax: fix typing of method arguments
* Runtime: fix behaviour of Sys.argv (Tomohiro Matsuyama)
* Runtime: fix caml_js_meth_call
* Compiler: fix assert false when deadcode is off
* Compiler: fix compilation of Js.debugger

# 2.3 (2014-06-30)

## Features/Changes
* Lib: remove deprecated Event_arrow
* Lib: introduce js_of_ocaml.tyxml
* Lib: introduce js_of_ocaml.weak (that loads weak.js)
       and remove predicate joo_weak
* Lib: introduce js_of_ocaml.log (Lwt logger)
* Lib: Dom_html.{range,selection} (Enguerrand Decorne)

## BugFixes
* Compiler: fix traduction of Ult binop (#177)
* Compiler: fix the build of compiler.{cmxs,cma} (Stéphane Glondu)
* Compiler: fix traduction of logical shift right
* Runtime: fix marshaling (#176)
* Meta: update predicates (joo_* -> jsoo_*)
* Lib: fix class type Dom_html.optionElement

# 2.2 (2014-05-15)

## Features/Changes
* Runtime: improve blit_string perf
* Compiler: option to warn about unused js variable
* Lib: audio/videoElement

## BugFixes
* Syntax: catch exception in syntax extension (#158)
* Compiler: compat with Node.js (global object) (#160)
* Runtime: fix graphics.js
* Lib: fix Dom.event interface

# 2.1 (2014-04-28)

## Features/Changes
* Runtime: bigarray comparison
* Compiler: allow to embed directory with -file dir_name=ext1,ext2:dest_path
* Compiler: can now output embedded files in a different js file
* Lib: js_of_ocaml.graphics
* Lib: Js.Unsafe.expr to embed JavasScript expression
  to be used instead of Js.Unsafe.variable (or eval_string)
* Lib: Sys_js.js_of_ocaml_version && Sys_js.file_content
* OCamlbuild plugin: Add the OASIS support, document the API and add the tags
  sourcemap (included in the meta-tag debug) and tailcall (#148)
  (by Jacques-Pascal Deplaix)

## BugFixes
* Syntax: Better type constraint (#84)
* Compiler: caml_failwith primitive was sometime missing (#147)
* Compiler: variable names used outside a program were
  not marked as reserved (#146)
* Lib: fix WebGl interface

# 2.0 (2014-04-11)

## Features/Changes
* Compiler: generate shorter variable names
* Parsing and minifying of external javascript file (ie: runtime)
  (by Hugo Heuzard)
* Compiler: JavaScript strict mode enabled
* Runtime: add support for recursive module (by Hugo Heuzard)
* Compiler: use trampoline to implement tailcall optim (by Hugo Heuzard)
* Improved OCaml toplevel UI (by Hugo Heuzard)
* Toplevel: support dynamic loading of cmo and cma files
* Runtime: add Bigarray support (contributed by Andrew Ray)
* Library: switch from "float Js.t" to just "float" for typing
  JavaScript numbers
* Compiler: Add javascript file lookup using findlib
  (+mypkg/myfile.js will read myfile.js from mypkg findlib directory)
  (by Hugo Heuzard)
* Compiler: improve missing primitives & reserved name detection
  (by Hugo Heuzard)
* Compiler: static evaluation of constant ("staticeval" optimisation)
  (by Hugo Heuzard)
* Compiler: share constants (by Hugo Heuzard)
* Compiler: alias primitives (by Hugo Heuzard)
* Compiler: complete javascript ast (by Hugo Heuzard)
* Compiler: 'caml_format_int %d x' compiles to ""+x (by Hugo Heuzard)
* Add JavaScript file in META (to be used with ocamlfind)
  (by Hugo Heuzard)
* Add Ocamlbuild plugin js_of_ocaml.ocamlbuild
  (by Jacques-Pascal Deplaix)
* Add/Install classlist.js, weak.js
* Add Url.Current.protocol (by Vicent Balat)
* Dependency: deriving instead of deriving-ocsigen
* Runtime: log wrong string encoding issues to the console (by Hugo Heuzard)
* Add compiler_libs (by Pierre Chambart)
* Compile syntax extension to native code as well (by Hugo Heuzard)
* Add a JavaScript parser (extracted from facebook/pfff)
* Compiler: remove redundant 'var' (by Hugo Heuzard)
* Compiler: improve compact mode, remove unnecessary space, semicolon
* Runtime: Support in_channel and out_channel (by Hugo Heuzard)
* Compiler: option to embed files into the generated js
  such files can be read using open_in (by Hugo Heuzard)
* Runtime: add cache for method lookup (by Hugo Heuzard)
* Compiler: experimental sourcemap support (by Hugo Heuzard)
* JavaScript Errors are now wrapped inside OCaml exceptions (by Hugo Heuzard)

## BugFixes
* Compiler: js file is not create in case of error (by Hugo Heuzard)
* Fix compatibility when using type covn (by Hugo Heuzard)
* Fix md5 : incorrect for string where (length % 64) E 56..59 (by Grégoire Henry)
* Fix caml_js_new: when called with more than 8 arguments
* Address a number of integer overflow issues (by Hugo Heuzard)
* Fix float comparisons (NaN was not compared correctly)

# 1.4 (2013-12-03)

## Features/Changes
* Add missing primitives for OCaml 4.01
* Improved Dom bindings (Hugo Heuzard and many other contributors)
* Add -linkall option to keep all provided primitives (Pierre Chambard)
* Improved tail-call optimization (Hugo Heuzard)
* Added optimization levels: -o {1,2,3} (Hugo Heuzard)

## Bugfixes
* Fixed some incorrect Dom bindings
* Fixed hypot primitive (Pierre Chambard)
* Fixed tail call optimization bug (some incorrect code was
  generated when the number of arguments did not match the number of
  function parameters)
* Fixed a bug with empty strings
* Fixed weak.js (primitives for Weak module)

# 1.3 (2012-11-28)

## Features/Changes
* Runtime and toplevel updates to support OCaml 4.0
* Add WebSocket bindings
* Added -debuginfo option to output source code location information
  (patch by Kensuke Matsuzaki)
* Dom_html: added change, input and hashChange event bindings
* Adding Lwt_js_events.async_loop and buffered_loop

## Bugfixes
* Fix array and string blitting with overlapping regions
* Url module: fix encoding of '+'
* Library: use 'this' instead of 'window' for better portability
* Dom_html: fix creation of elements with type or name attribute
  under IE 9
* Compiler: small fix to bytecode parsing that could result in
  incorrect generated code
* Dom_html: fix mouse wheel event bindings
* Dom: fix the type of item methods
* Deriving_json: tail-recursive serialisation of lists (by Hugo Heuzard)
* Deriving_json: fix parsing of float arrays and polymorphic variants
  (by Hugo Heuzard)

# 1.2 (2012-06-02)

## Features/Changes
* Improvements in the data-flow solver
* Add Dom_html.window##onscroll
* Dom_events.listen: handler should return boolean
* Add DOM drag/drop events

## Bugfixes
* Fix #284
* Fix return type of window##open_

# 1.1.1 (2012-03-15)

## Misc
* add webgl example

## Bugfixes
* Url parsing.
* webgl binding types

# 1.1 (2012-02-24)

## Libraries:
* Lots of new dom bindings
* WebGL
* Typed arrays
* Many speed improvement (marshal, strings, regexps)
* Many bug fixed

## Compiler:
* Add -I option to select directories containing cmi files
* Fix compilation of mutually recursive functions occurring in loops
* In Javascript output, parenthesize numbers when followed by a dot
* Fix order of evaluation bug
* Fix compilation of loops in 'try ... with' body (close #263)

## Misc:
* hyperbolic tree example

# 1.0.9 (2011-11-30)

* Bugfixe in polymorphic comparison.

# 1.0.8 (2011-11-25)

* Compatibility with deriving-0.3
* Libraries:
  * Adding Event_arrows.iter
  * Events: adding Dom_html.stopPropagation and ?propagate parameter in Event_arrows

# 1.0.7 (2011-11-18)

## Libraries:
* Add Dom_html.buttonPressed
* Add functions to downcast Dom_html.event into mouseEvent, keyboardEvent, ...
* Add Dom.document.adoptNode
* removed Date.now() function, not supported by all browsers
* Allow to test the button associated to a Dom_html.mouseEvent
* Add localStorage and sessionStorage api

## Bugfixes
* Deriving_json: fix string (un)marshaling (was broken for byte > 127)
* Do not emit string escape sequence \\v (not supported by IE8)
* Removed incorrect optimization of !(x < y) into (x ># y)
* Allow compilation on win32/msvc
* Open all files in binary mode

# 1.0.6 (2011-09-28)

## Libraries:
* add Dom_html.iFrameEliom##width
* add Dom_html.window##scroll
* add Dom.document##importNode

## Bugfixes
* browser compatility for Regexp.search and check_headers (XmlHttpRequest.send).

# 1.0.5 (2011-09-21)

## Libraries:
* XmlHttpRequest: allow to cancel ta XHR after receiving the HTTP headers
* Added the [CSS.Angle] module to handle angles in CSS
## Bugfixes
* array_get/set bound check

# 1.0.4 (2011-09-07)

## Libraries:
* History API
* improvements of CSS module
* Add coercion and attribute manipulation functions in Dom module

## Bugfixes
* fix typo in 'greater than or equal to'
* marshaling, unmarshaling and comparison
  are not recursive anymore: avoid stack overflow
* use custom formatter to pretty print Javascript
  code to avoid newlines where it is forbidden.
* fix type of Dom.nodeList.item (was optdef, is now opt)
* fixes for internet explorer.
* fixes for bug exposed by Berke Durak's tool jsure.

# 1.0.3 (2011-07-13)

## Libraries
* Add a CSS module
* export Form.form_elements
* add onsubmit method to Dom_html.formElement
* add classList property to dom elements

## Bugfixes
* 'caml_int_of_string' was incorrect for negative number
* Fixed misparenthesized Javascript 'new' expressions

# 1.0.2 (2011-04-13)

## Compiler
* Switch licence to LGPL
* API to generate a function instead of a standalone program
* option to compile an OCaml toplevel
## Libraries
* Add an optional JSON deriving class
* Add Math.random binding
* Add scrollWidth/scrollHeight element methods to the DOM
* Add coercion function Dom_html.CoerceTo.element
* Renaming functions in XmlHttpRequest:
  * send -> perform
  * send_string -> perform_raw_url
## Bugfixes
* fix compilation of Int32/Nativeint
* fix compilation of self-recursive functions in loops
* fix to File module for when there is no FileReader class in the host browser
* fixed big in weak support

# 1.0.1 (2011-01-26)

* Allow use of Lwt.pause.
* Split ocamlfind packages in two: syntax and library.
## Bugfixes
* conversion of Int64 to string.
* typos.

# 1.0 (2010-12-13)

Initial release
