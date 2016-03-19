(defmodule binary-string-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest one (check "1"))

(deftest two (check "10"))

(deftest three (check "11"))

(deftest four (check "100"))

(deftest nine (check "1001"))

(deftest twenty-six (check "11010"))

(deftest large (check "10001101000"))

(deftest carrot (is-equal 0 (binary-string:to-decimal "carrot")))

(defun check (string)
  (is-equal (list_to_integer string 2) (binary-string:to-decimal string)))
