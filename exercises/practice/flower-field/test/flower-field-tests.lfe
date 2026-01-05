(defmodule gigasecond-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest no-rows
  (assert-equal '() (flower-field:annotate '())))

(deftest no-columns
  (assert-equal '("") (flower-field:annotate '("")))

(deftest no-flowers
  (assert-equal
    '("   "
      "   "
      "   ")
    (flower-field:annotate
    '("   "
      "   "
      "   "))))

(deftest garden-full-of-flowers
  (assert-equal
    '("***"
      "***"
      "***")
    (flower-field:annotate
    '("***"
      "***"
      "***"))))

(deftest flower-surrounded-by-spaces
  (assert-equal
    '("111"
      "1*1"
      "111")
    (flower-field:annotate
    '("   "
      " * "
      "   "))))

(deftest space-surrounded-by-flowers
  (assert-equal
    '("***"
      "*8*"
      "***")
    (flower-field:annotate
    '("***"
      "* *"
      "***"))))

(deftest horizontal-line
  (assert-equal '("1*2*1")
    (flower-field:annotate '(" * * "))))

(deftest horizontal-line-flowers-at-edges
  (assert-equal '("*1 1*")
    (flower-field:annotate '("*   *"))))

(deftest vertical-line
  (assert-equal
    '("1"
      "*"
      "2"
      "*"
      "1")
    (flower-field:annotate
    '(" "
      "*"
      " "
      "*"
      " "))))

(deftest vertical-line-flowers-at-edges
  (assert-equal
    '("*"
      "1"
      " "
      "1"
      "*")
    (flower-field:annotate
    '("*"
      " "
      " "
      " "
      "*"))))

(deftest cross
  (assert-equal
    '(" 2*2 "
      "25*52"
      "*****"
      "25*52"
      " 2*2 ")
    (flower-field:annotate
    '("  *  "
      "  *  "
      "*****"
      "  *  "
      "  *  "))))

(deftest large-garden
  (assert-equal
    '("1*22*1"
      "12*322"
      " 123*2"
      "112*4*"
      "1*22*2"
      "111111")
    (flower-field:annotate
    '(" *  * "
      "  *   "
      "    * "
      "   * *"
      " *  * "
      "      "))))
