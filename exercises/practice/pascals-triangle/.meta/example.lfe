(defmodule pascals-triangle
  (export (rows 1)))

(defun rows (count)
  (lists:reverse (do-rows count '())))

(defun do-rows
  ((0 rows)
    rows)
  ((count '())
    (do-rows (- count 1) '((1))))
  ((count (= (cons head _) row))
    (do-rows (- count 1) (cons (next-row head) row))))

(defun next-row (row)
  (lists:zipwith (lambda (a b) (+ a b))
                 (++ '(0) row)
                 (++ row '(0))))
