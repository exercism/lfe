(defmodule queen-attack
  (export (create 2)
          (can-attack 2)))

(defrecord queen 
  row
  column)

(defun create
  ((row column)
   (when (or (or (< row 0)
                 (>= row 8))
             (or (< column 0)
                 (>= column 8))))
   'false)
  ((row column)
   (make-queen row row
               column column)))

(defun can-attack
  (((match-queen row R column _)
    (match-queen row R column _))
   'true)
  (((match-queen row _ column C)
    (match-queen row _ column C))
   'true)
  (((match-queen row WR column WC)
    (match-queen row BR column BC))
   (when (=:= (abs (- WR BR))
              (abs (- WC BC))))
   'true)
  ((_ _)
   'false))
