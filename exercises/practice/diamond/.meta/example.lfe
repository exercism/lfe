(defmodule diamond
  (export (rows 1)))

(defun first-letter () (car "A"))
(defun space () (car " "))

(defun rows (letter)
  (let* ((size (+ (- (car letter) (first-letter)) 1))
         (top (lists:map (lambda (idx) (row-for idx size))
                         (lists:seq 0 (- size 1)))))
    (++ top (bottom-half top))))

(defun bottom-half (top)
  (tl (lists:reverse top)))

(defun row-for
  ([0 size]
   (let ((outside (lists:duplicate (- size 1) (space))))
     (++ outside "A" outside)))
  ([idx size]
   (let* ((letter (list (+ (first-letter) idx)))
          (outside (lists:duplicate (- size 1 idx) (space)))
          (inside (lists:duplicate (- (* 2 idx) 1) (space))))
     (++ outside letter inside letter outside))))
