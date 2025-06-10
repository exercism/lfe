(defmodule nucleotide-count-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest empty-strand
  (is-equal `(#("A" 0) #("C" 0) #("G" 0) #("T" 0))
            (nucleotide-count:counts "")))

(deftest can-count-one-nucleotide-in-single-character-input
  (is-equal `(#("A" 0) #("C" 0) #("G" 1) #("T" 0))
            (nucleotide-count:counts "G")))

(deftest strand-with-repeated-nucleotide
  (is-equal `(#("A" 0) #("C" 0) #("G" 7) #("T" 0))
            (nucleotide-count:counts "GGGGGGG")))

(deftest strand-with-multiple-nucleotides
  (is-equal `(#("A" 20) #("C" 12) #("G" 17) #("T" 21))
            (nucleotide-count:counts "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")))

(deftest strand-with-invalid-nucleotides
  (is-error (nucleotide-count:counts "AGXXACT")))
