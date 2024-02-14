(defmodule reverse
  (export (string 1)))

(defun string (str)
    (lists:reverse str))