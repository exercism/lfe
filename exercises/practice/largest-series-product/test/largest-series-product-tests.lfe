(defmodule largest-series-product-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest finds-the-largest-product-if-span-equals-length
  (is-equal 18
            (largest-series-product:from-string "29" 2)))

(deftest can-find-the-largest-product-of-2-with-numbers-in-order
  (is-equal 72
            (largest-series-product:from-string "0123456789" 2)))

(deftest can-find-the-largest-product-of-2
  (is-equal 48
            (largest-series-product:from-string "576802143" 2)))

(deftest can-find-the-largest-product-of-3-with-numbers-in-order
  (is-equal 504
            (largest-series-product:from-string "0123456789" 3)))

(deftest can-find-the-largest-product-of-3
  (is-equal 270
            (largest-series-product:from-string "1027839564" 3)))
 
(deftest can-find-the-largest-product-of-5-with-numbers-in-order
  (is-equal 15120
            (largest-series-product:from-string "0123456789" 5)))

(deftest can-get-the-largest-product-of-a-big-number
  (let ((digits "73167176531330624919225119674426574742355349194934"))
    (is-equal 23520
              (largest-series-product:from-string digits 6))))

(deftest reports-zero-if-the-only-digits-are-zero
  (is-equal 0
            (largest-series-product:from-string "0000" 2)))

(deftest reports-zero-if-all-spans-include-zero
  (is-equal 0
            (largest-series-product:from-string "99099" 3)))

(deftest rejects-span-longer-than-string-length
  (is-error (largest-series-product:from-string "123" 4)))

(deftest reports-1-for-empty-string-and-empty-product
  (is-equal 1
            (largest-series-product:from-string "" 0)))

(deftest reports-1-for-nonempty-string-and-empty-product
  (is-equal 1
            (largest-series-product:from-string "123" 0)))

(deftest rejects-empty-string-and-nonzero-span
  (is-error (largest-series-product:from-string "" 1)))

(deftest rejects-invalid-character-in-digits
  (is-error (largest-series-product:from-string "1234a5" 2)))

(deftest rejects-negative-span
  (is-error (largest-series-product:from-string "12345" -1)))
