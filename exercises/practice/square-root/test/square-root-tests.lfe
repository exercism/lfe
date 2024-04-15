(defmodule square-root-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest root-of-1
  (is-equal 1 (square-root:calculate 1)))

(deftest root-of-4
  (is-equal 2 (square-root:calculate 4)))

(deftest root-of-25
  (is-equal 5 (square-root:calculate 25)))

(deftest root-of-81
  (is-equal 9 (square-root:calculate 81)))

(deftest root-of-196
  (is-equal 14 (square-root:calculate 196)))

(deftest root-of-65025
  (is-equal 255 (square-root:calculate 65025)))
