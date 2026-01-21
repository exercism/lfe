(defmodule flower-field-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest no-rows
  (is-equal '() (flower-field:annotate '())))

(deftest no-columns
  (is-equal '("") (flower-field:annotate '(""))))

(deftest no-flowers
  (is-equal
    '("   "
      "   "
      "   ")
    (flower-field:annotate
    '("   "
      "   "
      "   "))))

(deftest garden-full-of-flowers
  (is-equal
    '("***"
      "***"
      "***")
    (flower-field:annotate
    '("***"
      "***"
      "***"))))

(deftest flower-surrounded-by-spaces
  (is-equal
    '("111"
      "1*1"
      "111")
    (flower-field:annotate
    '("   "
      " * "
      "   "))))

(deftest space-surrounded-by-flowers
  (is-equal
    '("***"
      "*8*"
      "***")
    (flower-field:annotate
    '("***"
      "* *"
      "***"))))

(deftest horizontal-line
  (is-equal '("1*2*1")
    (flower-field:annotate '(" * * "))))

(deftest horizontal-line-flowers-at-edges
  (is-equal '("*1 1*")
    (flower-field:annotate '("*   *"))))

(deftest vertical-line
  (is-equal
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
  (is-equal
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
  (is-equal
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
  (is-equal
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

(deftest multiple-adjacent-flowers
  (is-equal
    '("1**1")
    (flower-field:annotate
    '(" ** "))))
