(defmodule dna-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest empty-dna-sting-has-no-adenine
  (is-equal 0 (dna:count "" "A")))

(deftest repetitive-cytosine-gets-counted
  (is-equal 5 (dna:count "CCCCC" "C")))

(deftest counts-only-thymine
  (is-equal 1 (dna:count "GGGGGTAACCCGG" "T")))

(deftest validates-nucleotides
  (is-error _ (dna:count "GACT" "X")))

(deftest validates-strand
  (is-error _ (dna:count "GACYT" "G")))

(deftest empty-dna-string-has-no-nucleotides
  (is-equal `(#("A" 0) #("C" 0) #("G" 0) #("T" 0))
            (dna:nucleotide-counts "")))

(deftest repetitive-sequence-has-only-guanine
  (is-equal `(#("A" 0) #("C" 0) #("G" 8) #("T" 0))
            (dna:nucleotide-counts "GGGGGGGG")))

(deftest counts-all-nucleotides
  (is-equal
    `(#("A" 20) #("C" 12) #("G" 17) #("T" 21))
    (dna:nucleotide-counts
      "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")))
