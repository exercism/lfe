(defmodule raindrops-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest sound-for-1-is-1
  (is-equal "1" (raindrops:convert 1)))

(deftest sound-for-3-is-pling
  (is-equal "Pling" (raindrops:convert 3)))

(deftest sound-for-5-is-plang
  (is-equal "Plang" (raindrops:convert 5)))

(deftest sound-for-7-is-plong
  (is-equal "Plong" (raindrops:convert 7)))

(deftest sound-for-6-is-pling
  (is-equal "Pling" (raindrops:convert 6)))

(deftest 2-to-the-power-3-no-raindrop-sound
  (is-equal "8" (raindrops:convert 8)))

(deftest sound-for-9-is-pling
  (is-equal "Pling" (raindrops:convert 9)))

(deftest sound-for-10-is-plang
  (is-equal "Plang" (raindrops:convert 10)))

(deftest sound-for-15-is-plingplang
  (is-equal "PlingPlang" (raindrops:convert 15)))

(deftest sound-for-21-is-plingplong
  (is-equal "PlingPlong" (raindrops:convert 21)))

(deftest sound-for-25-is-plang
  (is-equal "Plang" (raindrops:convert 25)))

(deftest sound-for-27-is-pling
  (is-equal "Pling" (raindrops:convert 27)))

(deftest sound-for-35-is-plangplong
  (is-equal "PlangPlong" (raindrops:convert 35)))

(deftest sound-for-49-is-plong
  (is-equal "Plong" (raindrops:convert 49)))

(deftest sound-for-52-no-raindrop-sound
  (is-equal "52" (raindrops:convert 52)))

(deftest sound-for-105-is-PlingPlangPlong
  (is-equal "PlingPlangPlong" (raindrops:convert 105)))

(deftest sound-for-3125-is-plang
  (is-equal "Plang" (raindrops:convert 3125)))
