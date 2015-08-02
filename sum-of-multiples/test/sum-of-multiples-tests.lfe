(defmodule sum-of-multiples-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest sum-to-1
  (is-equal 0 (sum-of-multiples:sum-of-multiples 1)))

(deftest sum-to-3
  (is-equal 3 (sum-of-multiples:sum-of-multiples 4)))

(deftest sum-to-10
  (is-equal 23 (sum-of-multiples:sum-of-multiples 10)))

(deftest sum-to-1000
  (is-equal 233168 (sum-of-multiples:sum-of-multiples 1000)))

(deftest sum-of-configurable-to-20
  (is-equal 51 (sum-of-multiples:sum-of-multiples '(7 13 17) 20)))

(deftest sum-of-configurable-to-10000
  (is-equal 2203160 (sum-of-multiples:sum-of-multiples '(43 47) 10000)))
