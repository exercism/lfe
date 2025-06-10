(defmodule protein-translation
  (export (proteins 1)))

(defun proteins (strand)
  (translate strand '()))

(defun translate
  (("" acc) (tuple 'ok acc))
  ((strand _) (when (< (length strand) 3))
      (tuple 'error "Invalid codon"))
  ((strand acc)
    (case (codon (string:slice strand 0 3))
      ((tuple 'ok codon) 
        (translate (string:slice strand 3 (length strand)) (++ acc (list codon))))
      ((tuple 'stop)
        (tuple 'ok acc))
      (else
        else))))

(defun codon
  (("AUG") (tuple 'ok 'Methionine))
  (("UUU") (tuple 'ok 'Phenylalanine))
  (("UUC") (tuple 'ok 'Phenylalanine))
  (("UUA") (tuple 'ok 'Leucine))
  (("UUG") (tuple 'ok 'Leucine))
  (("UCU") (tuple 'ok 'Serine))
  (("UCC") (tuple 'ok 'Serine))
  (("UCA") (tuple 'ok 'Serine))
  (("UCG") (tuple 'ok 'Serine))
  (("UAU") (tuple 'ok 'Tyrosine))
  (("UAC") (tuple 'ok 'Tyrosine))
  (("UGU") (tuple 'ok 'Cysteine))
  (("UGC") (tuple 'ok 'Cysteine))
  (("UGG") (tuple 'ok 'Tryptophan))
  (("UAA") (tuple 'stop))
  (("UAG") (tuple 'stop))
  (("UGA") (tuple 'stop))
  ((_) (tuple 'error "Invalid codon")))
