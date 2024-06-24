(defmodule binary-string
  (export (to-decimal 1)))

(defun to-decimal (string)
  (list_to_integer string 2))

