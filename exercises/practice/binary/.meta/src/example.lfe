(defmodule binary-string
  (export (to-decimal 1)))

(defun to-decimal (string)
  (try (element 2 (lists:foldr #'to-decimal/2 #(0 0) string))
    (catch (_ 0))))

(defun to-decimal
  ([#\0 `#(,n ,acc)] `#(,(+ n 1) ,acc))
  ([#\1 `#(,n ,acc)] `#(,(+ n 1) ,(+ acc (trunc (math:pow 2 n))))))
