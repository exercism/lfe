(defmodule darts-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest missed-target
  (is-equal 0 (darts:score -9 9)))

(deftest on-the-outer-circle
  (is-equal 1 (darts:score 0 10)))

(deftest on-the-middle-circle
  (is-equal 5 (darts:score -5 0)))

(deftest on-the-inner-circle
  (is-equal 10 (darts:score 0 -1)))

(deftest exactly-on-center
  (is-equal 10 (darts:score 0 0)))

(deftest near-the-center
  (is-equal 10 (darts:score -0.1 -0.1)))

(deftest just-within-the-inner-circle
  (is-equal 10 (darts:score 0.7 0.7)))

(deftest just-outside-the-inner-circle
  (is-equal 5 (darts:score 0.8 -0.8)))

(deftest just-within-the-middle-circle
  (is-equal 5 (darts:score -3.5 3.5)))

(deftest just-outside-the-middle-circle
  (is-equal 1 (darts:score -3.6 -3.6)))

(deftest just-within-the-outer-circle
  (is-equal 1 (darts:score -7.0 7.0)))

(deftest just-outside-the-outer-circle
  (is-equal 0 (darts:score 7.1 -7.1)))

(deftest asymmetric-position-between-the-inner-and-middle-circles
  (is-equal 5 (darts:score 0.5 -4)))
