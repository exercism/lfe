(defmodule darts
  (export (score 2)))

(defun score (x y)
  (assign-score (math:sqrt (+ (* x x)
                              (* y y)))))

(defun assign-score
  ((dist) (when (=< dist 1)) 10)
  ((dist) (when (=< dist 5)) 5)
  ((dist) (when (=< dist 10)) 1)
  ((_) 0))
