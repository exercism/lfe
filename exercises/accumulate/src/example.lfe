(defmodule accumulate
  (export (accumulate 2)))

(defun accumulate
  ([f '()]        '())
  ([f (cons h t)] (cons (funcall f h) (accumulate f t))))
