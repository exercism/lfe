(defmodule yacht
  (export (score 2)))

(include-lib "lfe/include/clj.lfe")

(defun score
  ((dice 'yacht)
    (if (=:= (length (lists:uniq dice)) 1) 50 0))
  ((dice 'ones)
    (sum dice 1))
  ((dice 'twos)
    (sum dice 2))
  ((dice 'threes)
    (sum dice 3))
  ((dice 'fours)
    (sum dice 4))
  ((dice 'fives)
    (sum dice 5))
  ((dice 'sixes)
    (sum dice 6))
  ((dice 'full-house)
    (if (=:= (lists:sort (maps:values (counter dice))) '(2 3))
        (lists:sum dice)
        0))
  ((dice 'four-of-a-kind)
    (let ((match (maps:filter (lambda (_ val) (or (=:= val 4)
                                                    (=:= val 5)))
                                 (counter dice))))
      (if (not (clj:empty? match))
          (* 4 (car (maps:keys match)))
          0)))
  ((dice 'little-straight)
    (if (=:= (lists:sort dice) '(1 2 3 4 5))
        30
        0))
  ((dice 'big-straight)
    (if (=:= (lists:sort dice) '(2 3 4 5 6))
        30
        0))
  ((dice 'choice)
    (lists:sum dice))
  ((_ _)
    0))

(defun counter (values)
  (lists:foldl
    (lambda (val counts)
      (let ((count (+ 1 (maps:get val counts 0))))
        (maps:put val count counts)))
    (map)
    values))

(defun sum (dice n)
  (let ((matches (lists:filter (lambda (die) (=:= die n)) dice)))
    (* n (length matches))))
