(defmodule hamming-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest empty
  (is-equal 0 (hamming:distance "" "")))

(deftest equal
  (is-equal 0 (hamming:distance "GAGCCTACTAACGGGAT" "GAGCCTACTAACGGGAT")))

(deftest all-different
  (is-equal 17 (hamming:distance "GAGCCTACTAACGGGAT" "FFFFFFFFFFFFFFFFF")))

(deftest ends-different
  (is-equal 2 (hamming:distance "GAGCCTACTAACGGGAT" "TAGCCTACTAACGGGAG")))

(deftest middle-different
  (is-equal 1 (hamming:distance "GAGCCTACTAACGGGAT" "GAGCCTACCAACGGGAT")))

(deftest some-differences
  (is-equal 6 (hamming:distance "GAGCCTACTAACGGGAT" "GAACCTCCCAAGGGATT")))
