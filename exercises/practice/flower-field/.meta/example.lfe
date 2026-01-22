(defmodule flower-field
  (export (annotate 1)))

(defun annotate
  (['()] '())
  ([(= (cons "" _) garden)] garden)
  ([garden]
   (process-garden (extend garden))))

(defun extend
  ([(= (cons r _) garden)]
   (let ((edge-row (lists:duplicate (+ (length r) 2) 32)))
     (cons edge-row (extend garden (list edge-row))))))

(defun extend
  (['() acc] acc)
  ([(cons row more) acc]
   (let ((extended-row (cons 32 (lists:reverse (cons 32 row)))))
     (extend more (cons extended-row acc)))))

(defun process-garden (garden)
  (process-garden garden '()))

(defun process-garden
  ([(list _ _) acc] acc)
  ([(cons prev-row more) acc]
   (let (((cons cur-row (cons next-row _)) more))
     (process-garden more (cons (process-row prev-row cur-row next-row) acc)))))

(defun process-row (prev cur next)
  (process-row prev cur next '()))

(defun process-row
  ([(list _ _) (list _ _) (list _ _) acc] acc)
  ([(cons _ more-prev) (cons _ more-cur) (cons _ more-next) acc]
   (when (== (car more-cur) 42))
   (process-row more-prev more-cur more-next (cons 42 acc)))
  ([(cons prev-prev (= (cons prev-cur (cons prev-next _)) more-prev))
    (cons cur-prev (= (cons _ (cons cur-next _)) more-cur))
    (cons next-prev (= (cons next-cur (cons next-next _)) more-next))
    acc]
   (let ((n (count-flowers (list prev-prev prev-cur prev-next
                                 cur-prev cur-next
                                 next-prev next-cur next-next))))
     (process-row more-prev more-cur more-next (cons (count-to-char n) acc)))))

(defun count-flowers (cells)
  (lists:foldl (lambda (x c) (if (== x 42) (+ c 1) c)) 0 cells))

(defun count-to-char
  ([0] 32)
  ([n] (+ 48 n)))
