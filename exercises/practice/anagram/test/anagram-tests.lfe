(defmodule anagram-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest no-matches
  (is-equal '()
            (anagram:find "diaper" '("hello" "world" "zombies" "pants"))))

(deftest detects-two-anagrams
  (is-equal '("lemons" "melons")
            (anagram:find "solemn" '("lemons" "cherry" "melons"))))

(deftest does-not-detect-anagram-subsets
  (is-equal '() (anagram:find "good" '("dog" "goody"))))

(deftest detects-anagram
  (is-equal '("inlets")
            (anagram:find "listen" '("enlists" "google" "inlets" "banana"))))

(deftest detects-three-anagrams
  (is-equal '("gallery" "regally" "largely")
            (anagram:find "allergy"
                          '("gallery" "ballerina" "regally" "clergy" "largely" "leading"))))

(deftest detects-multiple-anagrams-with-different-case
  (is-equal '("Eons" "ONES") (anagram:find "nose" '("Eons" "ONES"))))

(deftest does-not-detect-non-anagrams-with-identical-checksum
  (is-equal '() (anagram:find "mass" '("last"))))

(deftest detects-anagrams-case-insensitively
  (is-equal '("Carthorse")
            (anagram:find "Orchestra" '("cashregister" "Carthorse" "radishes"))))

(deftest detects-anagrams-using-case-insensitive-subject
  (is-equal '("carthorse")
            (anagram:find "Orchestra" '("cashregister" "carthorse" "radishes"))))

(deftest detects-anagrams-using-case-insensitive-possible-matches
  (is-equal '("Carthorse")
            (anagram:find "orchestra" '("cashregister" "Carthorse" "radishes"))))

(deftest does-not-detect-an-anagram-if-the-original-word-is-repeated
  (is-equal '() (anagram:find "go" '("goGoGO"))))

(deftest anagrams-must-use-all-letters-exactly-once
  (is-equal '() (anagram:find "tapper" '("patter"))))

(deftest words-are-not-anagrams-of-themselves
  (is-equal '() (anagram:find "BANANA" '("BANANA"))))

(deftest words-are-not-anagrams-of-themselves-even-if-letter-case-is-partially-different
  (is-equal '() (anagram:find "BANANA" '("Banana"))))

(deftest words-are-not-anagrams-of-themselves-even-if-letter-case-is-completely-different
  (is-equal '() (anagram:find "BANANA" '("banana"))))

(deftest words-other-than-themselves-can-be-anagrams
  (is-equal '("Silent") (anagram:find "LISTEN" '("LISTEN" "Silent"))))
