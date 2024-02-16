(defmodule protein-translation-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest empty-rna-sequence-no-protein 
  (is-equal (tuple 'ok '()) (protein-translation:proteins "")))

(deftest methione-rna-sequence
  (is-equal (tuple 'ok (list 'Methionine)) (protein-translation:proteins "AUG")))

(deftest phenylalanine-rna-sequence-1
  (is-equal (tuple 'ok (list 'Phenylalanine)) (protein-translation:proteins "UUU")))

(deftest phenylalanine-rna-sequence-2
  (is-equal (tuple 'ok (list 'Phenylalanine)) (protein-translation:proteins "UUC")))

(deftest leucine-rna-sequence-1
  (is-equal (tuple 'ok (list 'Leucine)) (protein-translation:proteins "UUA")))

(deftest serine-rna-sequence-1
  (is-equal (tuple 'ok (list 'Serine)) (protein-translation:proteins "UCU")))

(deftest serine-rna-sequence-2
  (is-equal (tuple 'ok (list 'Serine)) (protein-translation:proteins "UCC")))

(deftest serine-rna-sequence-3
  (is-equal (tuple 'ok (list 'Serine)) (protein-translation:proteins "UCA")))

(deftest serine-rna-sequence-4
  (is-equal (tuple 'ok (list 'Serine)) (protein-translation:proteins "UCG")))

(deftest tyrosine-rna-sequence-1
  (is-equal (tuple 'ok (list 'Tyrosine)) (protein-translation:proteins "UAU")))

(deftest tyrosine-rna-sequence-2
  (is-equal (tuple 'ok (list 'Tyrosine)) (protein-translation:proteins "UAC")))

(deftest cysteine-rna-sequence-1
  (is-equal (tuple 'ok (list 'Cysteine)) (protein-translation:proteins "UGU")))

(deftest cysteine-rna-sequence-2
  (is-equal (tuple 'ok (list 'Cysteine)) (protein-translation:proteins "UGC")))

(deftest tryptophan-rna-sequence
  (is-equal (tuple 'ok (list 'Tryptophan)) (protein-translation:proteins "UGG")))

(deftest stop-codon-rna-sequence-1
  (is-equal (tuple 'ok '()) (protein-translation:proteins "UAA")))

(deftest stop-codon-rna-sequence-2
  (is-equal (tuple 'ok '()) (protein-translation:proteins "UAG")))

(deftest stop-codon-rna-sequence-3
  (is-equal (tuple 'ok '()) (protein-translation:proteins "UGA")))

(deftest sequence-of-two-proteins-codons-translates-into-proteins
  (is-equal (tuple 'ok (list 'Phenylalanine 'Phenylalanine)) (protein-translation:proteins "UUUUUU")))

(deftest sequence-of-two-different-protein-codons-translates-into-proteins
  (is-equal (tuple 'ok (list 'Leucine 'Leucine)) (protein-translation:proteins "UUAUUG")))

(deftest translate-rna-strand-into-correct-protein-list
  (is-equal (tuple 'ok (list 'Methionine 'Phenylalanine 'Tryptophan)) (protein-translation:proteins "AUGUUUUGG")))

(deftest translation-stops-if-stop-codon-at-beginning-of-sequence
  (is-equal (tuple 'ok '()) (protein-translation:proteins "UAGUGG")))

(deftest translation-stops-if-stop-codon-at-end-of-two-codon-sequence
  (is-equal (tuple 'ok (list 'Tryptophan)) (protein-translation:proteins "UGGUAG")))

(deftest translation-stops-if-stop-codon-at-end-of-three-codon-sequence
  (is-equal (tuple 'ok (list 'Methionine 'Phenylalanine)) (protein-translation:proteins "AUGUUUUAA")))

(deftest translation-stops-if-stop-codon-in-middle-of-three-codon-sequence
  (is-equal (tuple 'ok (list 'Tryptophan)) (protein-translation:proteins "UGGUAGUGG")))

(deftest translation-stops-if-stop-codon-in-middle-of-six-codon-sequence
  (is-equal (tuple 'ok (list 'Tryptophan 'Cysteine 'Tyrosine)) (protein-translation:proteins "UGGUGUUAUUAAUGGUUU")))

(deftest non-existing-condon-cant-translate
  (is-equal (tuple 'error "Invalid codon") (protein-translation:proteins "AAA")))

(deftest unknown-amino-acides-not-part-of-a-codon-cant-translate
  (is-equal (tuple 'error "Invalid codon") (protein-translation:proteins "XYZ")))

(deftest incomplete-rna-sequence-cant-translate
  (is-equal (tuple 'error "Invalid codon") (protein-translation:proteins "AUGU")))
