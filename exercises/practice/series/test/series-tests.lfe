(defmodule series-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest slices-of-one-from-one
  (is-equal (series:from-string 1 "1")
            '("1")))

(deftest slices-of-one-from-two
  (is-equal (series:from-string 1 "12")
            '("1" "2")))

(deftest slices-of-two
  (is-equal (series:from-string 2 "35")
            '("35")))

(deftest slices-of-two-overlap
  (is-equal (series:from-string 2 "9142")
            '("91" "14" "42")))

(deftest slices-can-include-duplicates
  (is-equal (series:from-string 3 "777777")
            '("777" "777" "777" "777")))

(deftest slices-of-a-long-series
  (is-equal (series:from-string 5 "918493904243")
            '("91849" "18493" "84939" "49390" "93904" "39042" "90424" "04243")))

(deftest slice-length-is-too-large
    (is-error _ (series:from-string 6 "12345")))

(deftest slice-length-is-way-too-large
    (is-error _ (series:from-string 42 "12345")))

(deftest slice-length-cannot-be-zero
    (is-error _ (series:from-string 0 "12345")))

(deftest slice-length-cannot-be-negative
    (is-error _ (series:from-string -1 "123")))

(deftest empty-series-is-invalid
    (is-error _ (series:from-string 1 "")))
