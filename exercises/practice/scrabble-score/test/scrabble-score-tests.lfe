(defmodule scrabble-score-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest lowercase-letter
  (is-equal (scrabble-score:score "a") 1))

(deftest uppercase-letter
  (is-equal (scrabble-score:score "A") 1))

(deftest valuable-letter
  (is-equal (scrabble-score:score "f") 4))

(deftest short-word
  (is-equal (scrabble-score:score "at") 2))

(deftest short-valuable-word
  (is-equal (scrabble-score:score "zoo") 12))

(deftest medium-word
  (is-equal (scrabble-score:score "street") 6))

(deftest medium-valuable-word
  (is-equal (scrabble-score:score "quirky") 22))

(deftest long-mixed-case-word
  (is-equal (scrabble-score:score "OxyphenButazone") 41))

(deftest english-like-word
  (is-equal (scrabble-score:score "pinata") 8))

(deftest empty-input
  (is-equal (scrabble-score:score "") 0))

(deftest entire-alphabet-available
  (is-equal (scrabble-score:score "abcdefghijklmnopqrstuvwxyz") 87))
