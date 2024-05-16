(defmodule hamming-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest empty-strands
  (is-equal 0 (hamming:distance "" "")))

(deftest single-letter-identical-strands
  (is-equal 0 (hamming:distance "A" "A")))

(deftest single-letter-different-strands
  (is-equal 1 (hamming:distance "G" "T")))

(deftest long-identical-strands
  (is-equal 0 (hamming:distance "GGACTGAAATCTG" "GGACTGAAATCTG")))

(deftest long-different-strands
  (is-equal 9 (hamming:distance "GGACGGATTCTG" "AGGACGGATTCT")))

(deftest disallow-first-strand-longer
  (is-error (hamming:distance "AATG" "AAA")))

(deftest disallow-second-strand-longer
  (is-error (hamming:distance "ATA" "AGTG")))

(deftest disallow-empty-first-strand
  (is-error (hamming:distance "" "G")))

(deftest disallow-empty-second-strand
  (is-error (hamming:distance "G" "")))
