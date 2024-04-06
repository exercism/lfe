(defmodule collatz-conjecture-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest zero-steps-for-one
  (is-equal (collatz-conjecture:steps 1) 0))

(deftest divide-if-even
  (is-equal (collatz-conjecture:steps 16) 4))

(deftest even-and-odd-steps
  (is-equal (collatz-conjecture:steps 12) 9))

(deftest large-number-of-even-and-odd-steps
  (is-equal (collatz-conjecture:steps 1000000) 152))

(deftest zero-is-an-error
  (is-error _ (collatz-conjecture:steps 0)))

(deftest negative-value-is-an-error
  (is-error _ (collatz-conjecture:steps -1)))
