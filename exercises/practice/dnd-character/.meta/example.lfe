(defmodule dnd-character
  (export (new-character 0)
          (ability 0)
          (modifier 1)
          (get-strength 1)
          (get-dexterity 1)
          (get-constitution 1)
          (get-intelligence 1)
          (get-wisdom 1)
          (get-charisma 1)
          (get-hitpoints 1)))

(defrecord character
  strength
  dexterity
  constitution
  intelligence
  wisdom
  charisma
  hitpoints)

(defun new-character ()
  (let* ((my-constitution (ability))
         (my-hitpoints (+ (modifier my-constitution) 10)))
    (make-character strength (ability)
                    dexterity (ability)
                    constitution my-constitution
                    intelligence (ability)
                    wisdom (ability)
                    charisma (ability)
                    hitpoints my-hitpoints)))

(defun ability ()
  (let* ((all-dice (lists:map (lambda (_) (random:uniform 6)) (lists:seq 1 4)))
         (chosen-dice (tl (lists:sort all-dice))))
    (lists:sum chosen-dice)))

(defun modifier (score)
  (trunc (math:floor (/ (- score 10) 2))))

(defun get-strength (char)
  (character-strength char))

(defun get-dexterity (char)
  (character-dexterity char))

(defun get-constitution (char)
  (character-constitution char))

(defun get-intelligence (char)
  (character-intelligence char))

(defun get-wisdom (char)
  (character-wisdom char))

(defun get-charisma (char)
  (character-charisma char))

(defun get-hitpoints (char)
  (character-hitpoints char))
