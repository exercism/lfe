(defmodule series
  (export (from-string 2)))

(defun from-string (width string) (rows (length string) width string))

(defun rows
  ([length width (= (cons _head tail) string)] (when (> length width))
   (let ((`#(,row ,_rest) (lists:split width string)))
     (cons row (rows (- length 1) width tail))))
  ([_length _width string]
   `(,string)))
