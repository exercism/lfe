(defmodule queen-attack-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest queen-with-valid-position
  (is-not-equal (queen-attack:create 2 2) 'false))

(deftest queen-must-have-positive-row
  (is-not (queen-attack:create -2 2)))

(deftest queen-must-have-row-on-board
  (is-not (queen-attack:create 8 4)))

(deftest queen-must-have-positive-column
  (is-not (queen-attack:create 2 -2)))

(deftest queen-must-have-column-on-board
  (is-not (queen-attack:create 4 8)))

(deftest two-queens-cannot-attack
  (is-not (queen-attack:can-attack (queen-attack:create 2 4)
                                   (queen-attack:create 6 6))))

(deftest two-queens-can-attack-on-same-column
  (is (queen-attack:can-attack (queen-attack:create 4 5)
                               (queen-attack:create 2 5))))

(deftest two-queens-can-attack-on-first-diagonal
  (is (queen-attack:can-attack (queen-attack:create 2 2)
                               (queen-attack:create 0 4))))

(deftest two-queens-can-attack-on-second-diagonal
  (is (queen-attack:can-attack (queen-attack:create 2 2)
                               (queen-attack:create 3 1))))

(deftest two-queens-can-attack-on-third-diagonal
  (is (queen-attack:can-attack (queen-attack:create 2 2)
                               (queen-attack:create 1 1))))

(deftest two-queens-can-attack-on-fourth-diagonal
  (is (queen-attack:can-attack (queen-attack:create 1 7)
                               (queen-attack:create 0 6))))

(deftest two-queens-can-not-attack-if-falling-diagonals-only-same-when-reflected-along-longest-falling-diagonal
  (is-not (queen-attack:can-attack (queen-attack:create 4 1)
                                   (queen-attack:create 2 5))))
