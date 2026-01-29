(defmodule game-of-life
  (export (tick 1)))

(defun tick
  (('()) '())
  ((matrix)
   (let* ((rows (length matrix))
          (cols (length (car matrix)))
          (row-indices (lists:seq 0 (- rows 1)))
          (col-indices (lists:seq 0 (- cols 1))))
     (lc ((<- r row-indices))
       (lc ((<- c col-indices))
         (next-tick matrix r c rows cols))))))

(defun next-tick (matrix r c rows cols)
  (let ((current (get-cell matrix r c))
        (neighbors (count-neighbors matrix r c rows cols)))
    (update-cell current neighbors)))

(defun get-cell (matrix r c)
  (lists:nth (+ c 1) (lists:nth (+ r 1) matrix)))

(defun update-cell
  ((1 2) 1)
  ((1 3) 1)
  ((0 3) 1)
  ((_ _) 0))

(defun count-neighbors (matrix r c rows cols)
  (let ((deltas (lc ((<- dr '(-1 0 1))
                     (<- dc '(-1 0 1))
                     (=/= (list dr dc) '(0 0)))
                  (list dr dc))))
    (lists:foldl
     (lambda (d acc)
       (let ((nr (+ r (car d)))
             (nc (+ c (cadr d))))
         (if (and (>= nr 0) (< nr rows)
                  (>= nc 0) (< nc cols))
             (+ acc (get-cell matrix nr nc))
             acc)))
     0
     deltas)))
