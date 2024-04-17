(defmodule strain-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest keep-on-empty-list-returns-empty-list
  (is-equal () (strain:keep #'always-true/1
                            ())))

(deftest keeps-everything
  (is-equal '(1 3 5) (strain:keep #'always-true/1 
                                  '(1 3 5))))

(deftest keeps-nothing
  (is-equal () (strain:keep #'always-false/1
                            '(1 3 5))))

(deftest keeps-first-and-last
  (is-equal '(1 3) (strain:keep #'odd?/1
                                '(1 2 3))))

(deftest keeps-neither-first-nor-last
  (is-equal '(2) (strain:keep #'even?/1
                              '(1 2 3))))

(deftest keeps-strings
  (is-equal '("zebra" "zombies" "zealot")
            (strain:keep #'starts-with-z?/1
                          '("apple"
                            "zebra"
                            "banana"
                            "zombies"
                            "cherimoya"
                            "zealot"))))

(deftest keeps-lists
  (is-equal '((5 5 5)
              (5 1 2)
              (1 5 2)
              (1 2 5))
            (strain:keep #'contains-five?/1
                          '((1 2 3)
                            (5 5 5)
                            (5 1 2)
                            (2 1 2)
                            (1 5 2)
                            (2 2 1)
                            (1 2 5)))))

(deftest discard-on-empty-list-returns-empty-list
  (is-equal ()
            (strain:discard #'always-true/1
                            ())))

(deftest discards-everything
  (is-equal () (strain:discard #'always-true/1
                               '(1 2 3))))

(deftest discards-nothing
  (is-equal '(1 3 5)
            (strain:discard #'always-false/1
                            '(1 3 5))))

(deftest discards-first-and-last
  (is-equal '(2) (strain:discard #'odd?/1
                                 '(1 2 3))))

(deftest discards-neither-first-nor-last
  (is-equal '(1 3) (strain:discard #'even?/1
                                   '(1 2 3))))

(deftest discards-strings
  (is-equal '("apple" "banana" "cherimoya")
          (strain:discard #'starts-with-z?/1
                        '("apple"
                          "zebra"
                          "banana"
                          "zombies"
                          "cherimoya"
                          "zealot"))))

(deftest discards-lists
  (is-equal '((1 2 3)
              (2 1 2)
              (2 2 1))
            (strain:discard #'contains-five?/1
                          '((1 2 3)
                            (5 5 5)
                            (5 1 2)
                            (2 1 2)
                            (1 5 2)
                            (2 2 1)
                            (1 2 5)))))


(defun always-true (_) 'true)

(defun always-false (_) 'false)

(defun even? (n) (=:= (rem n 2) 0))

(defun odd? (n) (> (rem n 2) 0))

(defun starts-with-z? (str) (=:= (string:sub_string str 1 1) "z"))

(defun contains-five? (lst) (lists:member 5 lst))
