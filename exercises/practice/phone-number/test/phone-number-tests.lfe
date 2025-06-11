(defmodule phone-number-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest cleans-the-number
  (is-equal "2234567890" (phone-number:clean "(223) 456-7890")))

(deftest cleans-number-with-dots
  (is-equal "2234567890" (phone-number:clean "223.456.7890")))

(deftest cleans-number-with-multiple-spaces
  (is-equal "2234567890" (phone-number:clean "223 456   7890   ")))

(deftest invalid-when-nine-digits
  (is-not (phone-number:clean "123456789")))

(deftest invalid-when-eleven-digits-not-starting-with-one
  (is-not (phone-number:clean "21234567890")))

(deftest valid-when-eleven-digits-starting-with-one
  (is-equal "2234567890" (phone-number:clean "12234567890")))

(deftest valid-when-eleven-digits-starting-with-one-even-with-punctuation
  (is-equal "2234567890" (phone-number:clean "+1 (223) 456-7890")))

(deftest invalid-when-more-than-11-digits
  (is-not (phone-number:clean "321234567890")))

(deftest invalid-with-letters
  (is-not (phone-number:clean "523-abc-7890")))

(deftest invalid-with-punctuation
  (is-not (phone-number:clean "523-@:!-7890")))

(deftest invalid-if-area-code-starts-with-0
  (is-not (phone-number:clean "(023) 456-7890")))

(deftest invalid-if-area-code-starts-with-1
  (is-not (phone-number:clean "(123) 456-7890")))

(deftest invalid-if-exchange-code-starts-with-0
  (is-not (phone-number:clean "(223) 056-7890")))

(deftest invalid-if-exchange-code-starts-with-1
  (is-not (phone-number:clean "(223) 156-7890")))

(deftest invalid-if-area-code-starts-with-0-on-valid-11-digit-number
  (is-not (phone-number:clean "1 (023) 456-7890")))

(deftest invalid-if-area-code-starts-with-1-on-valid-11-digit-number
  (is-not (phone-number:clean "1 (123) 456-7890")))

(deftest invalid-if-exchange-code-starts-with-0-on-valid-11-digit-number
  (is-not (phone-number:clean "1 (223) 056-7890")))

(deftest invalid-if-exchange-code-starts-with-1-on-valid-11-digit-number
  (is-not (phone-number:clean "1 (223) 156-7890")))
