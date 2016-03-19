(defmodule luhn-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest invalid
  (is-not (luhn:valid? "1111"))
  (is-not (luhn:valid? "738")))

(deftest valid
  (is (luhn:valid? "8739567"))
  (is (luhn:valid? "8763"))
  (is (luhn:valid? "2323 2005 7766 3554")))

(deftest create
  (is-equal "2323 2005 7766 3554" (luhn:create "2323 2005 7766 355")))
