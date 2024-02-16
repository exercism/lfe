(defmodule roman-numerals-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest 1-is-I
  (is-equal "I" (roman-numerals:roman 1)))

(deftest 2-is-II
  (is-equal "II" (roman-numerals:roman 2)))

(deftest 3-is-III
  (is-equal "III" (roman-numerals:roman 3)))

(deftest 4-is-IV
  (is-equal "IV" (roman-numerals:roman 4)))

(deftest 5-is-V
  (is-equal "V" (roman-numerals:roman 5)))

(deftest 6-is-VI
  (is-equal "VI" (roman-numerals:roman 6)))

(deftest 9-is-IX
  (is-equal "IX" (roman-numerals:roman 9)))

(deftest 16-is-XVI
  (is-equal "XVI" (roman-numerals:roman 16)))

(deftest 27-is-XXVII
  (is-equal "XXVII" (roman-numerals:roman 27)))

(deftest 48-is-XLVIII
  (is-equal "XLVIII" (roman-numerals:roman 48)))

(deftest 49-is-XLIX
  (is-equal "XLIX" (roman-numerals:roman 49)))

(deftest 59-is-LIX
  (is-equal "LIX" (roman-numerals:roman 59)))

(deftest 66-is-LXVI
  (is-equal "LXVI" (roman-numerals:roman 66)))

(deftest 93-is-XCIII
  (is-equal "XCIII" (roman-numerals:roman 93)))

(deftest 141-is-CXLI
  (is-equal "CXLI" (roman-numerals:roman 141)))

(deftest 163-is-CLXIII
  (is-equal "CLXIII" (roman-numerals:roman 163)))

(deftest 166-is-CLXVI
  (is-equal "CLXVI" (roman-numerals:roman 166)))

(deftest 402-is-CDII
  (is-equal "CDII" (roman-numerals:roman 402)))

(deftest 575-is-DLXXV
  (is-equal "DLXXV" (roman-numerals:roman 575)))

(deftest 666-is-DCLXVI
  (is-equal "DCLXVI" (roman-numerals:roman 666)))

(deftest 911-is-CMXI
  (is-equal "CMXI" (roman-numerals:roman 911)))

(deftest 1024-is-MXXIV
  (is-equal "MXXIV" (roman-numerals:roman 1024)))

(deftest 1666-is-MDCLXVI
  (is-equal "MDCLXVI" (roman-numerals:roman 1666)))

(deftest 3000-is-MMM
  (is-equal "MMM" (roman-numerals:roman 3000)))

(deftest 3001-is-MMMI
  (is-equal "MMMI" (roman-numerals:roman 3001)))

(deftest 3999-is-MMMCMXCIX
  (is-equal "MMMCMXCIX" (roman-numerals:roman 3999)))
