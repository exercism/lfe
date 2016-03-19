(defmodule series-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest three
  (is-equal (series:from-string 3 "01234") '("012" "123" "234")))

(deftest four
  (is-equal (series:from-string 4 "01234") '("0123" "1234")))
