(defmodule roman-numerals
  (export (roman 1))
)

(defun numerals () '(("I" "V" "X")
                    ("X" "L" "C")
                    ("C" "D" "M")
                    ("M" "" ""))
)

(defun roman (value) (conv value "" (numerals)))

(defun conv 
  ((_remaining acc []) acc)
  ((remaining acc (cons (list ones fives tens) next)) (conv (div remaining 10) (++ (roman-digit (rem remaining 10) ones fives tens) acc) next))
)

(defun roman-digit
  ((0 _ones _fives _tens) "") 
  ((1 ones _fives tens) ones)
  ((2 ones _fives tens) (++ ones ones)) 
  ((3 ones _fives _tens) (++ ones ones ones))
  ((4 ones fives _tens) (++ ones fives))
  ((5 _ones fives _tens) fives)
  ((6 ones fives _tens) (++ fives ones))
  ((7 ones fives _tens) (++ fives ones ones))
  ((8 ones fives _tens) (++ fives ones ones ones))
  ((9 ones _fives tens) (++ ones tens))
)
