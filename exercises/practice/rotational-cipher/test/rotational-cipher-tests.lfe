(defmodule rotational-cipher-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest rotate-a-by-0-same-output-as-input
  (is-equal "a"
            (rotational-cipher:rotate "a" 0)))

(deftest rotate-a-by-1
  (is-equal "b"
            (rotational-cipher:rotate "a" 1)))

(deftest rotate-a-by-26-same-output-as-input
  (is-equal "a"
            (rotational-cipher:rotate "a" 26)))

(deftest rotate-m-by-13
  (is-equal "z"
            (rotational-cipher:rotate "m" 13)))

(deftest rotate-n-by-13-with-wrap-around-alphabet
  (is-equal "a"
            (rotational-cipher:rotate "n" 13)))

(deftest rotate-capital-letters
  (is-equal "TRL"
            (rotational-cipher:rotate "OMG" 5)))

(deftest rotate-spaces
  (is-equal "T R L"
            (rotational-cipher:rotate "O M G" 5)))

(deftest rotate-numbers
  (is-equal "Xiwxmrk 1 2 3 xiwxmrk"
            (rotational-cipher:rotate "Testing 1 2 3 testing" 4)))

(deftest rotate-punctuation
  (is-equal "Gzo'n zvo, Bmviyhv!"
            (rotational-cipher:rotate "Let's eat, Grandma!" 21)))

(deftest rotate-all-letters
  (is-equal "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
            (rotational-cipher:rotate "The quick brown fox jumps over the lazy dog."
                                      13)))

