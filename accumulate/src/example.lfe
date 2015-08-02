(defmodule accumulate
  (export (accumulate 2)))

(defun accumulate (f lst) (accumulate lst f ()))

(defun accumulate
  ([(cons h t) f out]
   (accumulate t f (cons (funcall f h) out)))
  (['() _f out]
   (lists:reverse out)))
