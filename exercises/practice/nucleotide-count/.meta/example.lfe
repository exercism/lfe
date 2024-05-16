(defmodule nucleotide-count
  (export (counts 1)))

(defun validate (nucleotide)
  (if (lists:member nucleotide '("A" "C" "G" "T"))
    `#(ok ,nucleotide)
    (erlang:error (++ "Invalid nucleotide: '" nucleotide "'"))))

(defun count (strand nucleotide)
  ;; `validate` will throw if `nucleotide` is invalid.
  (validate nucleotide)
  (lists:foldl
    (lambda (nucleotide* sum)
      (if (=:= (validate `(,nucleotide*)) `#(ok ,nucleotide))
        (+ sum 1)
        sum))
    0
    strand))

(defun counts (strand)
  (lists:map
    (lambda (nucleotide)
      `#(,nucleotide ,(count strand nucleotide)))
    `("A" "C" "G" "T")))
