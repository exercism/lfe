(defmodule eliuds-eggs
  (export (egg-count 1)))

(defun egg-count (display-value)
  (do-count display-value 0))

(defun do-count
  ((0 steps) steps)
  ((number steps) (when (> number 0)) (do-count (bsr number 1) (+ steps (band number 1)))))
