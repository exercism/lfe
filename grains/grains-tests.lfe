(defmodule grains-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest square-1
  (is-equal 1 (grains:square 1)))

(deftest square-2
  (is-equal 2 (grains:square 2)))

(deftest square-3
  (is-equal 4 (grains:square 3)))

(deftest square-4
  (is-equal 8 (grains:square 4)))

(deftest square-16
  (is-equal 32768 (grains:square 16)))

(deftest square-32
  (is-equal 2147483648 (grains:square 32)))

(deftest square-64
  (is-equal 9223372036854775808 (grains:square 64)))

(deftest total-grains
  (is-equal 18446744073709551615 (grains:total)))
