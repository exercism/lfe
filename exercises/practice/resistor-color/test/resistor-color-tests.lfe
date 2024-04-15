(defmodule resistor-color-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest color-codes-black
  (is-equal 0 (resistor-color:color-code "black")))

(deftest color-codes-white
  (is-equal 9 (resistor-color:color-code "white")))

(deftest color-codes-orange
  (is-equal 3 (resistor-color:color-code "orange")))

(deftest colors
  (is-equal '("black"
              "brown"
              "red"
              "orange"
              "yellow"
              "green"
              "blue"
              "violet"
              "grey"
              "white")
            (resistor-color:colors)))
