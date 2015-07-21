(defmodule anagram-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "eunit/include/eunit.hrl")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest no-matches
  (is-equal '() (anagram:find "diaper" '("hello" "world" "zombies" "pants"))))

(deftest detect-simple-anagram
  (is-equal '("tan") (anagram:find "ant" '("tan" "stand" "at"))))

(deftest does-not-confuse-different-duplicates
  (is-equal '() (anagram:find "galea" '("eagle"))))

(deftest eliminate-angram-subsets
  (is-equal '() (anagram:find "good" '("dog" "goody"))))

(deftest detect-anagram
  (is-equal
    '("inlets")
    (anagram:find "listen" '("enlists" "google" "inlets" "banana"))))

(deftest multiple-anagrams
  (is-equal
    '("gallery" "regally" "largely")
    (anagram:find
      "allergy"
      '("gallery" "ballerina" "regally" "clergy" "largely" "leading"))))

(deftest case-insensitive-subject
  (is-equal
    '("carthorse")
    (anagram:find "Orchestra" '("cashregister" "carthorse" "radishes"))))

(deftest case-insensitive-candidate
  (is-equal
    '("Carthorse")
    (anagram:find "Orchestra" '("cashregister" "Carthorse" "radishes"))))

(deftest does-not-detect-a-word-as-its-own-anagram
  (is-equal
    '("cron")
    (anagram:find "corn" '("corn" "dark" "Corn" "rank" "CORN" "cron" "park"))))
