(defmodule largest-series-product-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest three
  (is-equal 504 (largest-series-product:from-string "0123456789" 3)))

(deftest five
  (is-equal 15120 (largest-series-product:from-string "0123456789" 5)))

(deftest six
  (let ((string "73167176531330624919225119674426574742355349194934"))
    (is-equal 23520 (largest-series-product:from-string string 6))))

(deftest all-zeroes
  (is-equal 0 (largest-series-product:from-string "0000" 2)))

(deftest all-contain-zeroes
  (is-equal 0 (largest-series-product:from-string "99099" 3)))

(deftest too-long
  (is-error _ (largest-series-product:from-string "123" 4)))

(deftest empty-product
  (is-equal 1 (largest-series-product:from-string "" 0)))

(deftest nonempty-string-empty-product
  (is-equal 1 (largest-series-product:from-string "123" 0)))

(deftest empty-string-nonempty-product
  (is-error _ (largest-series-product:from-string "" 1)))
