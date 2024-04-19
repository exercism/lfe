(defmodule resistor-color-duo-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest brown-and-black
  (is-equal 10
            (resistor-color-duo:value '("brown" "black"))))

(deftest blue-and-grey
  (is-equal 68
            (resistor-color-duo:value '("blue" "grey"))))

(deftest yellow-and-violet
  (is-equal 47
            (resistor-color-duo:value '("yellow" "violet"))))

(deftest white-and-red
  (is-equal 92
            (resistor-color-duo:value '("white" "red"))))

(deftest orange-and-orange
  (is-equal 33
            (resistor-color-duo:value '("orange" "orange"))))

(deftest ignore-additional-colors
  (is-equal 51
            (resistor-color-duo:value '("green" "brown" "orange"))))

(deftest black-and-brown-one-digit
  (is-equal 1
            (resistor-color-duo:value '("black" "brown"))))
