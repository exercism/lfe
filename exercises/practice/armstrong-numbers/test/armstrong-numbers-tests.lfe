(defmodule armstrong-numbers-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest zero-is-an-armstrong-number
  (is (armstrong-numbers:armstrong-number? 0)))

(deftest single-digit-numbers-are-armstrong-numbers
  (is (armstrong-numbers:armstrong-number? 5)))

(deftest there-are-no-two-digit-armstrong-numbers
  (is-not (armstrong-numbers:armstrong-number? 10)))

(deftest three-digit-number-that-is-an-armstrong-number
  (is (armstrong-numbers:armstrong-number? 153)))

(deftest three-digit-number-that-is-not-an-armstrong-number
  (is-not (armstrong-numbers:armstrong-number? 100)))

(deftest four-digit-number-that-is-an-armstrong-number
  (is (armstrong-numbers:armstrong-number? 9474)))

(deftest four-digit-number-that-is-not-an-armstrong-number
  (is-not (armstrong-numbers:armstrong-number? 9475)))

(deftest seven-digit-number-that-is-an-armstrong-number
  (is (armstrong-numbers:armstrong-number? 9926315)))

(deftest seven-digit-number-that-is-not-an-armstrong-number
  (is-not (armstrong-numbers:armstrong-number? 9926314)))

