(defmodule reverse-string-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest reverses-empty-string
  (is-equal ""
            (reverse:string "")))

(deftest reverses-a-word
  (is-equal "tobor"
            (reverse:string "robot")))

(deftest reverses-a-capitalized-word
  (is-equal "nemaR"
            (reverse:string "Ramen")))

(deftest reverses-a-palindrome
  (is-equal "racecar"
            (reverse:string "racecar")))

(deftest reverses-an-even-sized-word
  (is-equal "reward"
            (reverse:string "drawer")))
