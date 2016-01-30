(defmodule etl
  (export (transform 1)))

(defun transform (old-value)
  (orddict:to_list
    (orddict:from_list
      (lists:flatten
        (invert old-value)))))

(defun invert (pairs)
  (lists:foldl
    (match-lambda
      ([`#(,key ,values) a]
       (lists:foldl
         (lambda (value acc)
           (orddict:update
             (string:to_lower value)
             (lambda (old)
               (lists:flatten (++ `(,old) `(,key))))
             key
             acc))
         a
         values)))
    (orddict:new)
    pairs))
