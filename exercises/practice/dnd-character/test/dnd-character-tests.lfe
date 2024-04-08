(defmodule dnd-character-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest ability-modifier-for-score-3-is-negative-4
  (is-equal (dnd-character:modifier 3) -4))

(deftest ability-modifier-for-score-4-is-negative-3
  (is-equal (dnd-character:modifier 4) -3))

(deftest ability-modifier-for-score-5-is-negative-3
  (is-equal (dnd-character:modifier 5) -3))

(deftest ability-modifier-for-score-6-is-negative-2
  (is-equal (dnd-character:modifier 6) -2))

(deftest ability-modifier-for-score-7-is-negative-2
  (is-equal (dnd-character:modifier 7) -2))

(deftest ability-modifier-for-score-8-is-negative-1
  (is-equal (dnd-character:modifier 8) -1))

(deftest ability-modifier-for-score-9-is-negative-1
  (is-equal (dnd-character:modifier 9) -1))

(deftest ability-modifier-for-score-10-is-zero
  (is-equal (dnd-character:modifier 10) 0))

(deftest ability-modifier-for-score-11-is-zero
  (is-equal (dnd-character:modifier 11) 0))

(deftest ability-modifier-for-score-12-is-positive-1
  (is-equal (dnd-character:modifier 12) 1))

(deftest ability-modifier-for-score-13-is-positive-1
  (is-equal (dnd-character:modifier 13) 1))

(deftest ability-modifier-for-score-14-is-positive-2
  (is-equal (dnd-character:modifier 14) 2))

(deftest ability-modifier-for-score-15-is-positive-2
  (is-equal (dnd-character:modifier 15) 2))

(deftest ability-modifier-for-score-16-is-positive-3
  (is-equal (dnd-character:modifier 16) 3))

(deftest ability-modifier-for-score-17-is-positive-3
  (is-equal (dnd-character:modifier 17) 3))

(deftest ability-modifier-for-score-18-is-positive-4
  (is-equal (dnd-character:modifier 18) 4))

(defun is-valid (score)
  (and (>= score 3)
       (=< score 18)))

(deftest random-ability-is-withis-valid
  (let ((score (dnd-character:ability)))
    (is (is-valid score))))

(deftest random-character-is-valid
  (let ((char (dnd-character:new-character)))
    (is (and (is-valid (dnd-character:get-strength char))
             (is-valid (dnd-character:get-dexterity char))
             (is-valid (dnd-character:get-constitution char))
             (is-valid (dnd-character:get-intelligence char))
             (is-valid (dnd-character:get-wisdom char))
             (is-valid (dnd-character:get-charisma char))
             (=:= (dnd-character:get-hitpoints char)
               (+ (dnd-character:modifier
                  (dnd-character:get-constitution char))
                  10))))))

(deftest each-ability-is-only-calculated-once
  (let ((char (dnd-character:new-character)))
    (is (and (=:= (dnd-character:get-strength char)
                  (dnd-character:get-strength char))
             (=:= (dnd-character:get-dexterity char)
                  (dnd-character:get-dexterity char))
             (=:= (dnd-character:get-constitution char)
                  (dnd-character:get-constitution char))
             (=:= (dnd-character:get-intelligence char)
                  (dnd-character:get-intelligence char))
             (=:= (dnd-character:get-wisdom char)
                  (dnd-character:get-wisdom char))
             (=:= (dnd-character:get-charisma char)
                  (dnd-character:get-charisma char))))))
