(defmodule high-scores
  (export (latest 1)
          (personal-best 1)
          (personal-top-three 1)))

(defun latest (scores)
  (car (lists:reverse scores)))

(defun personal-best (scores)
  (lists:max scores))

(defun personal-top-three (scores)
  (lists:sublist (lists:sort (lambda (a b) (> a b)) scores) 3))
