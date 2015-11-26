(defun compile (file)
  (let* ((`#(ok [#(ok ,module ,binary)]) (lfe_comp:file file '[binary]))
         (`#(module ,module) (code:load_binary module file binary)))
    `#m(module ,module)))

(defun compile-tests
  ([`#m(file ,file module ,module)]
   (let ((tests (++ (atom_to_list module) "-tests.lfe"))
         (dir   (filename:dirname (filename:dirname file))))
     (compile (filename:join `(,dir "test" ,tests))))))

(defun run-tests
  ([`#m(module ,module)]
   (eunit:test (list_to_atom (++ (atom_to_list module) "-tests")) '[verbose])))


(code:add_pathsa '("_build/default/lib/ltest"))

(let ((modules (lists:map
                 (lambda (x) (maps:merge `#m(file ,x) (compile x)))
                 (filelib:wildcard "*/src/example.lfe"))))
  (lists:foreach #'compile-tests/1 modules)
  (let ((results (lists:map #'run-tests/1 modules)))
    (halt (length (lc ((<- x results) (=/= x 'ok)) x)))))
