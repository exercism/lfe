(defmodule difference-of-squares-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest square-of-sum-1
  (is-equal (difference-of-squares:square-of-sum 1) 1))

(deftest square-of-sum-5
  (is-equal (difference-of-squares:square-of-sum 5) 225))

(deftest square-of-sum-100
  (is-equal (difference-of-squares:square-of-sum 100) 25502500))

(deftest sum-of-squares-1
  (is-equal (difference-of-squares:sum-of-squares 1) 1))

(deftest sum-of-squares-5
  (is-equal (difference-of-squares:sum-of-squares 5) 55))

(deftest sum-of-squares-100
  (is-equal (difference-of-squares:sum-of-squares 100) 338350))

(deftest difference-of-squares-1
  (is-equal (difference-of-squares:difference-of-squares 1) 0))

(deftest difference-of-squares-5
  (is-equal (difference-of-squares:difference-of-squares 5) 170))

(deftest difference-of-squares-100
  (is-equal (difference-of-squares:difference-of-squares 100) 25164150))
