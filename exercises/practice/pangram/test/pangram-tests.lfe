(defmodule pangram-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest empty-sentence
  (is-not (pangram:pangram? "")))

(deftest perfect-lower-case
  (is (pangram:pangram? "abcdefghijklmnopqrstuvwxyz")))

(deftest only-lower-case
  (is (pangram:pangram? "the quick brown fox jumps over the lazy dog")))

(deftest missing-the-letter-x
  (is-not (pangram:pangram? "a quick movement of the enemy will jeopardize five gunboats")))

(deftest missing-the-letter-h
  (is-not (pangram:pangram? "five boxing wizards jump quickly at it")))

(deftest with-underscores
  (is (pangram:pangram? "the_quick_brown_fox_jumps_over_the_lazy_dog")))

(deftest with-numbers
  (is (pangram:pangram? "the 1 quick brown fox jumps over the 2 lazy dogs")))

(deftest missing-letters-replaced-by-numbers
  (is-not (pangram:pangram? "7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog")))

(deftest mixed-case-and-punctuation
  (is (pangram:pangram? "\"Five quacking Zephyrs jolt my wax bed.\"")))

(deftest a-to-m-and-A-to-M-are-twenty-six-different-characters-but-not-a-pangram
  (is-not (pangram:pangram? "abcdefghijklm ABCDEFGHIJKLM")))
