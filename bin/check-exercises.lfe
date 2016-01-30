(defun compile (file) (compile file 'false))

(defun compile (file set-file?)
  (let* ((`#(ok [#(ok ,module ,binary)]) (lfe_comp:file file '[binary]))
         (`#(module ,module) (code:load_binary module file binary)))
    (if set-file?
      `#m(file ,file module ,module)
      `#m(module ,module))))

(defun compile-example (file) (compile file 'true))

(defun compile-tests
  ([`#m(file ,file module ,module)]
   (let ((tests (++ (atom_to_list module) "-tests.lfe"))
         (dir   (filename:dirname (filename:dirname file))))
     (mset (compile (filename:join `(,dir "test" ,tests)))))))



(defun run-tests
  ([`#m(module ,module)]
   (eunit:test (list_to_atom (++ (atom_to_list module) "-tests")) '[verbose])))

(defun mod-tests
  ([`#m(module ,module)]
   (list_to_atom (++ (atom_to_list module) "-tests"))))


(code:add_pathsa '("_build/default/lib/ltest"))

(let* ((examples (filelib:wildcard "exercises/*/src/example.lfe"))
       (modules  (lists:map #'compile-example/1 examples)))
  (lists:foreach #'compile-tests/1 modules)
  (case (eunit:test (lists:map #'mod-tests/1 modules) '[verbose])
    ('ok (halt 0))
    (_   (halt 42))))
