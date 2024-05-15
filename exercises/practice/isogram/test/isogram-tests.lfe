(defmodule isogram-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest empty-string
  (is (isogram:isogram? "")))

(deftest isogram-with-only-lower-case-characters
  (is (isogram:isogram? "isogram")))

(deftest word-with-one-duplicate-character
  (is-not (isogram:isogram? "eleven")))

(deftest word-with-one-duplicated-character-from-the-end-of-the-alphabet
  (is-not (isogram:isogram? "zzyzx")))

(deftest longest-reported-english-isogram
  (is (isogram:isogram? "subdermatoglyphic")))

(deftest word-with-duplicated-character-in-mixed-case
  (is-not (isogram:isogram? "Alphabet")))

(deftest word-with-duplicate-character-in-mixed-case-lowercase-first
  (is-not (isogram:isogram? "alphAbet")))

(deftest hypothetical-isogrammic-word-with-hyphen
  (is (isogram:isogram? "thumbscrew-japingly")))

(deftest hypothetical-isogrammic-word-with-duplicated-character-following-hyphen
  (is-not (isogram:isogram? "thumbscrew-jappingly")))

(deftest isogram-with-duplicated-hyphen
  (is (isogram:isogram? "six-year-old")))

(deftest made-up-name-that-is-an-isogram
  (is (isogram:isogram? "Emily Jung Schwartzkopf")))

(deftest duplicated-character-in-the-middle
  (is-not (isogram:isogram? "accentor")))

(deftest same-first-and-last-characters
  (is-not (isogram:isogram? "angola")))

(deftest word-with-duplicated-character-and-with-two-hyphens
  (is-not (isogram:isogram? "up-to-date")))

