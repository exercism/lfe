(defmodule yacht-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest yacht
  (is-equal 50 (yacht:score '(5 5 5 5 5) 'yacht)))

(deftest not-yacht
  (is-equal 0 (yacht:score '(1 3 3 2 5) 'yacht)))

(deftest ones
  (is-equal 3 (yacht:score '(1 1 1 3 5) 'ones)))

(deftest ones-out-of-order
  (is-equal 3 (yacht:score '(3 1 1 5 1) 'ones)))

(deftest no-ones
  (is-equal 0 (yacht:score '(4 3 6 5 5) 'ones)))

(deftest twos
  (is-equal 2 (yacht:score '(2 3 4 5 6) 'twos)))

(deftest fours
  (is-equal 8 (yacht:score '(1 4 1 4 1) 'fours)))

(deftest yacht-counted-as-threes
  (is-equal 15 (yacht:score '(3 3 3 3 3) 'threes)))

(deftest yacht-of-threes-counted-as-fives
  (is-equal 0 (yacht:score '(3 3 3 3 3) 'fives)))

(deftest fives
  (is-equal 10 (yacht:score '(1 5 3 5 3) 'fives)))

(deftest sixes
  (is-equal 6 (yacht:score '(2 3 4 5 6) 'sixes)))

(deftest full-house-two-small-three-big
  (is-equal 16 (yacht:score '(2 2 4 4 4) 'full-house)))

(deftest full-house-three-small-two-big
  (is-equal 19 (yacht:score '(5 3 3 5 3) 'full-house)))

(deftest two-pair-is-not-a-full-house
  (is-equal 0 (yacht:score '(2 2 4 4 5) 'full-house)))

(deftest four-of-a-kind-is-not-a-full-house
  (is-equal 0 (yacht:score '(1 4 4 4 4) 'full-house)))

(deftest yacht-is-not-a-full-house
  (is-equal 0 (yacht:score '(2 2 2 2 2) 'full-house)))

(deftest four-of-a-kind
  (is-equal 24 (yacht:score '(6 6 4 6 6) 'four-of-a-kind)))

(deftest yacht-can-be-scored-as-four-of-a-kind
  (is-equal 12 (yacht:score '(3 3 3 3 3) 'four-of-a-kind)))

(deftest full-house-is-not-four-of-a-kind
  (is-equal 0 (yacht:score '(3 3 3 5 5) 'four-of-a-kind)))

(deftest little-straight
  (is-equal 30 (yacht:score '(3 5 4 1 2) 'little-straight)))

(deftest little-straight-as-big-straight
  (is-equal 0 (yacht:score '(1 2 3 4 5) 'big-straight)))

(deftest four-in-order-but-not-a-little-straight
  (is-equal 0 (yacht:score '(1 1 2 3 4) 'little-straight)))

(deftest no-pairs-but-not-a-little-straight
  (is-equal 0 (yacht:score '(1 2 3 4 6) 'little-straight)))

(deftest minimum-is-1-maximum-is-5-but-not-a-little-straight
  (is-equal 0 (yacht:score '(1 1 3 4 5) 'little-straight)))

(deftest big-straight
  (is-equal 30 (yacht:score '(4 6 2 5 3) 'big-straight)))

(deftest big-straight-as-little-straight
  (is-equal 0 (yacht:score '(6 5 4 3 2) 'little-straight)))

(deftest no-pairs-but-not-a-big-straight
  (is-equal 0 (yacht:score '(6 5 4 3 1) 'big-straight)))

(deftest choice
  (is-equal 23 (yacht:score '(3 3 5 6 6) 'choice)))

(deftest yacht-as-choice
  (is-equal 10 (yacht:score '(2 2 2 2 2) 'choice)))

