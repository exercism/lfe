(defmodule isbn-verifier-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest valid-isbn
  (is (isbn-verifier:valid? "3-598-21508-8")))

(deftest invalid-isbn-check-digit
  (is-not (isbn-verifier:valid? "3-598-21508-9")))

(deftest valid-isbn-with-a-check-digit-of-ten
  (is (isbn-verifier:valid? "3-598-21507-X")))

(deftest check-digit-is-a-character-other-than-x
  (is-not (isbn-verifier:valid? "3-598-21507-A")))

(deftest invalid-check-digit-in-isbn-is-not-treated-as-zero
  (is-not (isbn-verifier:valid? "4-598-21507-B")))

(deftest invalid-character-in-isbn-is-not-treated-as-zero
  (is-not (isbn-verifier:valid? "3-598-P1581-X")))

(deftest x-is-only-valid-as-a-check-digit
  (is-not (isbn-verifier:valid? "3-598-2X507-9")))

(deftest only-one-check-digit-is-allowed
  (is-not (isbn-verifier:valid? "3-598-21508-96")))

(deftest x-is-not-substituted-by-the-value-ten
  (is-not (isbn-verifier:valid? "3-598-2X507-5")))

(deftest valid-isbn-without-separating-dashes
  (is (isbn-verifier:valid? "3598215088")))

(deftest isbn-without-separating-dashes-and-x-as-check-digit
  (is (isbn-verifier:valid? "359821507X")))

(deftest isbn-without-check-digit-and-dashes
  (is-not (isbn-verifier:valid? "359821507")))

(deftest too-long-isbn-and-no-dashes
  (is-not (isbn-verifier:valid? "3598215078X")))

(deftest too-short-isbn
  (is-not (isbn-verifier:valid? "00")))

(deftest isbn-without-check-digit
  (is-not (isbn-verifier:valid? "3-598-21507")))

(deftest check-digit-of-x-should-not-be-used-for-zero
  (is-not (isbn-verifier:valid? "3-598-21515-X")))

(deftest empty-isbn
  (is-not (isbn-verifier:valid? "")))

(deftest input-is-nine-characters
  (is-not (isbn-verifier:valid? "134456729")))

(deftest invalid-characters-are-not-ignored-after-checking-length
  (is-not (isbn-verifier:valid? "3132P34035")))

(deftest invalid-characters-are-not-ignored-before-checking-length
  (is-not (isbn-verifier:valid? "3598P215088")))

(deftest input-is-too-long-but-contains-a-valid-isbn
  (is-not (isbn-verifier:valid? "98245726788")))
