(defmodule dna-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest empty
  (is-equal 0 (dna:hamming-distance "" "")))

(deftest equal
  (is-equal 0 (dna:hamming-distance "GAGCCTACTAACGGGAT" "GAGCCTACTAACGGGAT")))

(deftest all-different
  (is-equal 17 (dna:hamming-distance "GAGCCTACTAACGGGAT" "FFFFFFFFFFFFFFFFF")))

(deftest ends-different
  (is-equal 2 (dna:hamming-distance "GAGCCTACTAACGGGAT" "TAGCCTACTAACGGGAG")))

(deftest middle-different
  (is-equal 1 (dna:hamming-distance "GAGCCTACTAACGGGAT" "GAGCCTACCAACGGGAT")))

(deftest some-differences
  (is-equal 6 (dna:hamming-distance "GAGCCTACTAACGGGAT" "GAACCTCCCAAGGGATT")))
