(defmodule luhn-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest single-digit-strings-can-not-be-valid
  (is-not (luhn:valid? "1")))

(deftest a-single-zero-is-invalid
  (is-not (luhn:valid? "0")))

(deftest a-simple-valid-SIN-that-remains-valid-reversed
  (is (luhn:valid? "059")))

(deftest a-simple-valid-SIN-that-becomes-invalid-if-reversed
  (is (luhn:valid? "59")))

(deftest a-valid-Canadian-SIN
  (is (luhn:valid? "055 444 285")))

(deftest invalid-Canadian-SIN
  (is-not (luhn:valid? "055 444 286")))

(deftest invalid-credit-card
  (is-not (luhn:valid? "8273 1232 7352 0569")))

(deftest invalid-long-number-with-an-even-remainder
  (is-not (luhn:valid? "1 2345 6789 1234 5678 9012")))

(deftest invalid-long-with-a-remainder-divisible-by-5
  (is-not (luhn:valid? "1 2345 6789 1234 5678 9013")))

(deftest valid-number-with-an-even-number-of-digits
  (is (luhn:valid? "095 245 88")))

(deftest valid-number-with-an-odd-number-of-spaces
  (is (luhn:valid? "234 567 891 234")))

(deftest valid-strings-with-a-non-digit-added-at-the-end-become-invalid
  (is-not (luhn:valid? "059a")))

(deftest valid-strings-with-punctuation-included-become-invalid
  (is-not (luhn:valid? "055-444-285")))

(deftest valid-strings-with-symbols-included-become-invalid
  (is-not (luhn:valid? "055# 444$ 285")))

(deftest single-zero-with-space-is-invalid
  (is-not (luhn:valid? " 0")))

(deftest more-than-a-single-zero-is-valid
  (is (luhn:valid? "0000 0")))

(deftest input-digit-9-is-correctly-converted-to-output-digit-9
  (is (luhn:valid? "091")))

(deftest very-long-input-is-valid
  (is (luhn:valid? "9999999999 9999999999 9999999999 9999999999")))

(deftest valid-luhn-with-an-odd-number-of-digits-and-non-zero-first-digit
  (is (luhn:valid? "109")))

(deftest using-ascii-value-for-non-doubled-non-digit-isnt-allowed
  (is-not (luhn:valid? "055b 444 285")))

(deftest using-ascii-value-for-doubled-non-digit-isnt-allowed
  (is-not (luhn:valid? ":9")))

(deftest non-numeric-non-space-char-in-the-middle-with-a-sum-thats-divisible-by-10-isnt-allowed
  (is-not (luhn:valid? "59%59")))
