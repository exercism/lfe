(defmodule resistor-color-trio-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest orange-and-orange-and-black
  (is-equal "33 ohms"
            (resistor-color-trio:label '("orange" "orange" "black"))))

(deftest blue-and-grey-and-brown
  (is-equal "680 ohms"
            (resistor-color-trio:label '("blue" "grey" "brown"))))

(deftest red-and-black-and-red
  (is-equal "2 kiloohms"
            (resistor-color-trio:label '("red" "black" "red"))))

(deftest green-and-brown-and-orange
  (is-equal "51 kiloohms"
            (resistor-color-trio:label '("green" "brown" "orange"))))

(deftest yellow-and-violet-and-yellow
  (is-equal "470 kiloohms"
            (resistor-color-trio:label '("yellow" "violet" "yellow"))))

(deftest blue-and-violet-and-blue
  (is-equal "67 megaohms"
            (resistor-color-trio:label '("blue" "violet" "blue"))))

(deftest minimum-possible-value
  (is-equal "0 ohms"
            (resistor-color-trio:label '("black" "black" "black"))))

(deftest maximum-possible-value
  (is-equal "99 gigaohms"
            (resistor-color-trio:label '("white" "white" "white"))))

(deftest first-two-colors-make-an-invalid-octal-number
  (is-equal "8 ohms"
            (resistor-color-trio:label '("black" "grey" "black"))))

(deftest ignore-extra-colors
  (is-equal "650 kiloohms"
            (resistor-color-trio:label '("blue" "green" "yellow" "orange"))))
