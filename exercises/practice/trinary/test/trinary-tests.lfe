(defmodule trinary-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest trinary-1-is-decimal-1
  (is-equal 1 (trinary:to-decimal "1")))

(deftest trinary-2-is-decimal-2
  (is-equal 2 (trinary:to-decimal "2")))

(deftest trinary-10-is-decimal-3
  (is-equal 3 (trinary:to-decimal "10")))

(deftest trinary-11-is-decimal-4
  (is-equal 4 (trinary:to-decimal "11")))

(deftest trinary-100-is-decimal-9
  (is-equal 9 (trinary:to-decimal "100")))

(deftest trinary-112-is-decimal-14
  (is-equal 14 (trinary:to-decimal "112")))

(deftest trinary-222-is-decimal-26
  (is-equal 26 (trinary:to-decimal "222")))

(deftest trinary-1122000120-is-decimal-32091
  (is-equal 32091 (trinary:to-decimal "1122000120")))

(deftest invalid-trinary-digits-returns-0
  (is-equal 0 (trinary:to-decimal "1234")))

(deftest invalid-word-as-input-returns-0
  (is-equal 0 (trinary:to-decimal "carrot")))

(deftest invalid-numbers-with-letters-as-input-returns-0
  (is-equal 0 (trinary:to-decimal "0a1b2c")))
