(defmodule matching-brackets-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest paired-square-brackets
  (is (matching-brackets:paired? "[]")))

(deftest empty-string
  (is (matching-brackets:paired? "")))

(deftest unpaired-brackets
  (is-not (matching-brackets:paired? "[[")))

(deftest wrong-ordered-brackets
  (is-not (matching-brackets:paired? "}{")))

(deftest wrong-closing-bracket
  (is-not (matching-brackets:paired? "{]")))

(deftest paired-with-whitespace
  (is (matching-brackets:paired? "{ }")))

(deftest partially-paired-brackets
  (is-not (matching-brackets:paired? "{[])")))

(deftest simple-nested-brackets
  (is (matching-brackets:paired? "{[]}")))

(deftest several-paired-brackets
  (is (matching-brackets:paired? "{}[]")))

(deftest paired-and-nested-brackets
  (is (matching-brackets:paired? "([{}({}[])])")))

(deftest unopened-closing-brackets
  (is-not (matching-brackets:paired? "{[)][]}")))

(deftest unpaired-and-nested-brackets
  (is-not (matching-brackets:paired? "([{])")))

(deftest paired-and-wrong-nested-brackets
  (is-not (matching-brackets:paired? "[({]})")))

(deftest paired-and-wrong-nested-brackets-but-innermost-are-correct
  (is-not (matching-brackets:paired? "[({}])")))

(deftest paired-and-incomplete-brackets
  (is-not (matching-brackets:paired? "{}[")))

(deftest too-many-closing-brackets
  (is-not (matching-brackets:paired? "[]]")))

(deftest early-unexpected-brackets
  (is-not (matching-brackets:paired? ")()")))

(deftest early-mismatched-brackets
  (is-not (matching-brackets:paired? "{)()")))

(deftest math-expression
  (is (matching-brackets:paired? "(((185 + 223.85) * 15) - 543)/2")))

(deftest complex-latex-expression
  (let ((expr "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"))
    (is (matching-brackets:paired? expr))))
