(defmodule trinary
  (export (to-decimal 1)))

(defun BASE () 3)

(defun to-decimal (string) (to-decimal string 0))

(defun to-decimal
  ([() acc] acc)
  ([`(,digit . ,digits) acc] (when (>= digit #\0) (=< digit #\2))
   (to-decimal digits (+ (digit->int digit) (* acc (BASE)))))
  ([_string _acc] 0))

(defun digit->int
  ([digit] (when (>= digit #\0) (=< digit #\2))
   (- digit #\0)))
