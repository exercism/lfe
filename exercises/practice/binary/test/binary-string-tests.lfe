(defmodule binary-string-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest binary-0-is-decimal-0
  (is-equal 0 (binary-string:to-decimal "0")))

(deftest binary-1-is-decimal-1
  (is-equal 1 (binary-string:to-decimal "1")))

(deftest binary-10-is-decimal-2
  (is-equal 2 (binary-string:to-decimal "10")))

(deftest binary-11-is-decimal-3
  (is-equal 3 (binary-string:to-decimal "11")))

(deftest binary-100-is-decimal-4
  (is-equal 4 (binary-string:to-decimal "100")))

(deftest binary-1001-is-decimal-9
  (is-equal 9 (binary-string:to-decimal "1001")))

(deftest binary-11010-is-decimal-26
  (is-equal 26 (binary-string:to-decimal "11010")))

(deftest binary-10001101000-is-decimal-1128
  (is-equal 1128 (binary-string:to-decimal "10001101000")))

(deftest binary-ignores-leading-zeros
  (is-equal 31 (binary-string:from-decimal "000011111")))

