(defmodule triangle-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest equilateral-triangle-all-sides-are-equal
  (is-equal (triangle:kind 2 2 2) 'equilateral))

(deftest equilateral-triangle-all-zero-sides-is-not-a-triangle
  (is-not (triangle:kind 0 0 0)))

(deftest equilateral-triangle-sides-may-be-floats
  (is-equal (triangle:kind 0.5 0.5 0.5) 'equilateral))

(deftest isosceles-triangle-last-two-sides-are-equal
  (is-equal (triangle:kind 3 4 4) 'isosceles))

(deftest isosceles-triangle-first-two-sides-are-equal
  (is-equal (triangle:kind 4 4 3) 'isosceles))

(deftest isosceles-triangle-first-and-last-sides-are-equal
  (is-equal (triangle:kind 4 3 4) 'isosceles))

(deftest isosceles-first-triangle-inequality
  (is-not (triangle:kind 1 2 3)))

(deftest isosceles-second-triangle-inequality
  (is-not (triangle:kind 1 3 1)))

(deftest isosceles-third-triangle-inequality
  (is-not (triangle:kind 3 1 1)))

(deftest isosceles-may-be-floats
  (is-equal (triangle:kind 0.5 0.4 0.5) 'isosceles))

(deftest scalene-no-sides-are-equal
  (is-equal (triangle:kind 5 4 6) 'scalene))

(deftest scalene-may-not-violate-triangle-inequality
  (is-not (triangle:kind 7 3 2)))

(deftest scalene-may-be-floats
  (is-equal (triangle:kind 0.5 0.4 0.6) 'scalene))
