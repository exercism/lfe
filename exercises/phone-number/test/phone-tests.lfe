(defmodule phone-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest cleans-number
  (is-equal "1234567890" (phone:number "(123) 456-7890")))

(deftest cleans-number-with-dots
  (is-equal "1234567890" (phone:number "123.456.7890")))

(deftest valid-when-eleven-digits
  (is-equal "1234567890" (phone:number "11234567890")))

(deftest invalid-when-eleven-digits
  (is-equal "0000000000" (phone:number "21234567890")))

(deftest invalid-when-nine-digits
  (is-equal "0000000000" (phone:number "123456789")))

(deftest area-code
  (is-equal "123" (phone:area-code "1234567890")))

(deftest pprint
  (is-equal "(123) 456-7890" (phone:pprint "1234567890"))
  (is-equal "(123) 456-7890" (phone:pprint "11234567890")))
