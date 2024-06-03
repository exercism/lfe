(defmodule high-scores-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest latest-score
    (is-equal 30 (high-scores:latest '(100 0 90 30))))

(deftest personal-best
    (is-equal 100 (high-scores:personal-best '(40 100 70))))

(deftest personal-top-three-from-a-list-of-scores
    (is-equal '(100 90 70)
              (high-scores:personal-top-three '(10 30 90 30 100 20 10 0 30 40 40 70 70))))

(deftest personal-top-highest-to-lowest
    (is-equal '(30 20 10) (high-scores:personal-top-three '(20 10 30))))

(deftest personal-top-when-there-is-a-tie
    (is-equal '(40 40 30) (high-scores:personal-top-three '(40 20 40 30))))

(deftest personal-top-when-there-are-less-than-three
    (is-equal '(70 30) (high-scores:personal-top-three '(30 70))))

(deftest personal-top-when-there-is-only-one
    (is-equal '(40) (high-scores:personal-top-three '(40))))

