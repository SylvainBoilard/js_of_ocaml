(module
   (tag $ocaml_exception (export "ocaml_exception") (param (ref eq)))

   (type $block (array (mut (ref eq))))

   (type $string (array (mut i8)))

   (type $compare_ext (func (param (ref eq)) (param (ref eq)) (result i32)))

   (type $custom_operations
      (struct
         (field (ref $compare_ext))
         ;; ZZZ
      ))

   (type $custom (struct (field (ref $custom_operations))))

   (global $caml_global_data (mut (ref $block))
      (array.new $block (i31.new (i32.const 0)) (i32.const 12)))

   (func (export "caml_register_global")
      (param (ref eq)) (param $v (ref eq)) (param (ref eq)) (result (ref eq))
      (local $i i32)
      (local.set $i (i31.get_u (ref.cast i31 (local.get 0))))
      (if (i32.lt_u (local.get $i) (array.len (global.get $caml_global_data)))
         (then
            (array.set $block (global.get $caml_global_data)
               (local.get $i) (local.get $v))))
      (i31.new (i32.const 0)))

   (func $caml_raise_constant (param (ref eq))
      (throw $ocaml_exception (local.get 0)))

   (func $caml_raise_with_arg (param $tag (ref eq)) (param $arg (ref eq))
      (throw $ocaml_exception
         (array.new_fixed $block
            (i31.new (i32.const 0)) (local.get $tag) (local.get $arg))))

   (global $INVALID_EXN i32 (i32.const 3))

   (func $caml_invalid_argument (param $arg (ref eq))
       (call $caml_raise_with_arg
           (array.get $block (global.get $caml_global_data)
              (global.get $INVALID_EXN))
           (local.get 0)))

   (data $index_out_of_bounds "index out of bounds")

   (func $caml_array_bound_error (export "caml_array_bound_error")
      (call $caml_invalid_argument
         (array.new_data $string $index_out_of_bounds
            (i32.const 0) (i32.const 19))))

   (global $ZERO_DIVIDE_EXN i32 (i32.const 5))

   (func (export "caml_raise_zero_divide")
      (call $caml_raise_constant
         (array.get $block (global.get $caml_global_data)
                    (global.get $ZERO_DIVIDE_EXN))))

   (global $int64_ops (export "int64_ops") (ref $custom_operations)
      (struct.new $custom_operations (ref.func $int64_cmp)))

   (type $int64
      (sub $custom (struct (field (ref $custom_operations)) (field i64))))

   (func $int64_cmp (param $v1 (ref eq)) (param $v2 (ref eq)) (result i32)
      (local $i1 i64) (local $i2 i64)
      (local.set $i1 (struct.get $int64 1 (ref.cast $int64 (local.get $v1))))
      (local.set $i2 (struct.get $int64 1 (ref.cast $int64 (local.get $v2))))
      (i32.sub (i64.gt_s (local.get $i1) (local.get $i2))
               (i64.lt_s (local.get $i1) (local.get $i2))))

   (func $caml_copy_int64 (param $i i64) (result (ref eq))
      (struct.new $int64 (global.get $int64_ops) (local.get $i)))

   (func (export "caml_int64_of_string") (param $v (ref eq)) (result (ref eq))
      (local $s (ref $string)) (local $i i32) (local $len i32)
      (local $res i64)
      (local.set $s (ref.cast $string (local.get $v)))
      (local.set $res (i64.const 0))
      (local.set $i (i32.const 0))
      (local.set $len (array.len (local.get $s)))
      ;; ZZZ validation / negative numbers / ...
      (loop $loop
         (if (i32.lt_s (local.get $i) (local.get $len))
            (then
               (local.set $res
                  (i64.add (i64.mul (local.get $res) (i64.const 10))
                     (i64.extend_i32_s
                        (i32.sub
                           (array.get_u $string (local.get $s) (local.get $i))
                           (i32.const 48)))))
               (local.set $i (i32.add (local.get $i) (i32.const 1)))
               (br $loop))))
      (return_call $caml_copy_int64 (local.get $res)))

   (data $Array_make "Array.make")

   (func (export "caml_make_vect")
      (param $n (ref eq)) (param $v (ref eq)) (result (ref eq))
      (local $sz i32) (local $b (ref $block))
      (local.set $sz (i32.add (i31.get_s (ref.cast i31 (local.get $n)))
                              (i32.const 1)))
      (if (i32.lt_s (local.get $sz) (i32.const 1))
         (then
            (call $caml_invalid_argument
               (array.new_data $string $Array_make
                               (i32.const 0) (i32.const 10)))))
      (local.set $b (array.new $block (local.get $v) (local.get $sz)))
      (array.set $block (local.get $b) (i32.const 0) (i31.new (i32.const 0)))
      (local.get $b))

   (func (export "caml_fs_init") (result (ref eq))
      (i31.new (i32.const 0)))

   (func (export "caml_ml_flush") (param (ref eq)) (result (ref eq))
      (i31.new (i32.const 0)))

   (func (export "caml_ml_open_descriptor_in")
      (param (ref eq)) (result (ref eq))
      (i31.new (i32.const 0)))

   (func (export "caml_ml_open_descriptor_out")
      (param (ref eq)) (result (ref eq))
      (i31.new (i32.const 0)))

   (func (export "caml_ml_out_channels_list")
      (param (ref eq)) (result (ref eq))
      (i31.new (i32.const 0)))

   (func (export "caml_register_named_value")
      (param (ref eq)) (param (ref eq)) (result (ref eq))
      (i31.new (i32.const 0)))

   (func (export "caml_int_of_string")
      (param (ref eq)) (param (ref eq)) (result (ref eq))
      (i31.new (i32.const 0)))

   (global $caml_oo_last_id (mut i32) (i32.const 0))

   (func (export "caml_fresh_oo_id") (param (ref eq)) (result (ref eq))
      (local $id i32)
      (local.set $id (global.get $caml_oo_last_id))
      (global.set $caml_oo_last_id (i32.add (local.get $id) (i32.const 1)))
      (i31.new (local.get $id)))

   (func (export "caml_obj_dup") (param (ref eq)) (result (ref eq))
      ;; ZZZ Deal with non-block values?
      (local $orig (ref $block))
      (local $res (ref $block))
      (local $len i32)
      (local $i i32)
      (local.set $orig (ref.cast $block (local.get 0)))
      (local.set $len (array.len (local.get $orig)))
      (local.set $res
         (array.new $block (array.get $block (local.get $orig) (i32.const 0))
            (local.get $len)))
      (local.set $i (i32.const 1))
      (loop $loop
         (if (i32.lt_s (local.get $i) (local.get $len))
            (then
               (array.set $block (local.get $res) (local.get $i)
                  (array.get $block (local.get $orig) (local.get $i)))
               (local.set $i (i32.add (local.get $i) (i32.const 1)))
               (br $loop))))
      (local.get $res))

   (func (export "caml_string_equal")
      (param $p1 (ref eq)) (param $p2 (ref eq)) (result (ref eq))
      (local $s1 (ref $string)) (local $s2 (ref $string))
      (local $len i32) (local $i i32)
      (if (ref.eq (local.get $p1) (local.get $p2))
         (then (return (i31.new (i32.const 1)))))
      (local.set $s1 (ref.cast $string (local.get $p1)))
      (local.set $s2 (ref.cast $string (local.get $p2)))
      (local.set $len (array.len $string (local.get $s1)))
      (if (i32.ne (local.get $len) (array.len $string (local.get $s2)))
         (then (return (i31.new (i32.const 0)))))
      (local.set $i (i32.const 0))
      (loop $loop
         (if (i32.lt_s (local.get $i) (local.get $len))
            (then
               (if (i32.ne (array.get_u $string (local.get $s1) (local.get $i))
                           (array.get_u $string (local.get $s2) (local.get $i)))
                  (then (return (i31.new (i32.const 0)))))
               (local.set $i (i32.add (local.get $i) (i32.const 1)))
               (br $loop))))
      (i31.new (i32.const 1)))
)
