(defmodule series
  (export (from-string 2)))

(defun from-string
  ([_ ""]
    (error "empty series"))
  ([slice _] (when (=< slice 0))
    (error "slice length must be positive"))
  ([slice series] (when (> slice (length series)))
    (error "slice length is too large"))
  ([slice series] 
   (let* ((final-start (- (length series) slice))
          (all-starts (lists:seq 0 final-start)))
     (lists:map
       (lambda (i) (lists:sublist series (+ i 1) slice))
       all-starts))))
