(defmodule perfect-numbers-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest smallest-perfect-number
  (is-equal 'perfect (perfect-numbers:classify 6)))

(deftest medium-perfect-number
  (is-equal 'perfect (perfect-numbers:classify 28)))

(deftest large-perfect-number
    (is-equal 'perfect (perfect-numbers:classify 33550336)))

(deftest smallest-abundant-number
    (is-equal 'abundant (perfect-numbers:classify 12)))

(deftest medium-abundant-number
    (is-equal 'abundant (perfect-numbers:classify 30)))

(deftest large-abundant-number
    (is-equal 'abundant (perfect-numbers:classify 33550335)))

(deftest smallest-prime-deficient-number
    (is-equal 'deficient (perfect-numbers:classify 2)))

(deftest smallest-non-prime-deficient-number
    (is-equal 'deficient (perfect-numbers:classify 4)))

(deftest medium-deficient-number
    (is-equal 'deficient (perfect-numbers:classify 32)))

(deftest large-deficient-number
    (is-equal 'deficient (perfect-numbers:classify 33550337)))

(deftest edge-case-number-no-factors-other-than-self
    (is-equal 'deficient (perfect-numbers:classify 1)))

(deftest zero-is-rejected
    (is-not (perfect-numbers:classify 0)))

(deftest negative-integer-is-rejected
    (is-not (perfect-numbers:classify -1)))

