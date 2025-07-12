(defmodule all-your-base-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest single-bit-one-to-decimal
  (let ((input-base 2)
        (digits '(1))
        (output-base 10))
    (is-equal '(1) (all-your-base:rebase input-base digits output-base))))

(deftest binary-to-single-decimal
  (let ((input-base 2)
        (digits '(1 0 1))
        (output-base 10))
    (is-equal '(5) (all-your-base:rebase input-base digits output-base))))

(deftest single-decimal-to-binary
  (let ((input-base 10) 
        (digits '(5))
        (output-base 2))
    (is-equal '(1 0 1) (all-your-base:rebase input-base digits output-base))))

(deftest binary-to-multiple-decimal
  (let ((input-base 2)
        (digits '(1 0 1 0 1 0))
        (output-base 10))
    (is-equal '(4 2) (all-your-base:rebase input-base digits output-base))))

(deftest decimal-to-binary
  (let ((input-base 10)
        (digits '(4 2))
        (output-base 2))
    (is-equal '(1 0 1 0 1 0) (all-your-base:rebase input-base digits output-base))))

(deftest trinary-to-hexadecimal
  (let ((input-base 3)
        (digits '(1 1 2 0))
        (output-base 16))
    (is-equal '(2 10) (all-your-base:rebase input-base digits output-base))))

(deftest hexadecimal-to-trinary
  (let ((input-base 16)
        (digits '(2 10))
        (output-base 3))
    (is-equal '(1 1 2 0) (all-your-base:rebase input-base digits output-base))))

(deftest fifteen-bit-integer
  (let ((input-base 97)
        (digits '(3 46 60))
        (output-base 73))
    (is-equal '(6 10 45) (all-your-base:rebase input-base digits output-base))))

(deftest empty-list
  (let ((input-base 2)
        (digits '())
        (output-base 10))
    (is-equal '(0) (all-your-base:rebase input-base digits output-base))))

(deftest single-zero
  (let ((input-base 10)
        (digits '(0))
        (output-base 2))
    (is-equal '(0) (all-your-base:rebase input-base digits output-base))))

(deftest multiple-zeros
  (let ((input-base 10)
        (digits '(0 0 0))
        (output-base 2))
    (is-equal '(0) (all-your-base:rebase input-base digits output-base))))

(deftest leading-zeros
  (let ((input-base 7)
        (digits '(0 6 0))
        (output-base 10))
    (is-equal '(4 2) (all-your-base:rebase input-base digits output-base))))    

(deftest input-base-is-one
  (let ((input-base 1)
        (digits '(0))
        (output-base 10))
    (is-error (all-your-base:rebase input-base digits output-base))))

(deftest input-base-is-zero
  (let ((input-base 0)
        (digits '())
        (output-base 10))
    (is-error (all-your-base:rebase input-base digits output-base))))

(deftest input-base-is-negative
  (let ((input-base -2)
        (digits '(1))
        (output-base 10))
    (is-error (all-your-base:rebase input-base digits output-base))))

(deftest negative-digit
  (let ((input-base 2)
        (digits '(1 -1 1 0 1 0))
        (output-base 10))
    (is-error (all-your-base:rebase input-base digits output-base))))

(deftest invalid-positive-digit
  (let ((input-base 2)
        (digits '(1 2 1 0 1 0))
        (output-base 10))
    (is-error (all-your-base:rebase input-base digits output-base))))

(deftest output-base-is-one
  (let ((input-base 2)
        (digits '(1 0 1 0 1 0))
        (output-base 1))
    (is-error (all-your-base:rebase input-base digits output-base))))

(deftest output-base-is-zero
  (let ((input-base 10)
        (digits '(7))
        (output-base 0))
    (is-error (all-your-base:rebase input-base digits output-base))))

(deftest output-base-is-negative
  (let ((input-base 2)
        (digits '(1))
        (output-base -7))
    (is-error (all-your-base:rebase input-base digits output-base))))

(deftest both-bases-are-negative
  (let ((input-base -2)
        (digits '(1))
        (output-base -7))
    (is-error (all-your-base:rebase input-base digits output-base))))
