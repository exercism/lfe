(defmodule allergies
  (export (allergies 1)
          (allergic-to? 2)))

(defmacro ALLERGIES ()
  `'(eggs             ; 2^0
     peanuts          ; 2^1
     shellfish        ; 2^2
     strawberries     ; 2^3
     tomatoes
     chocolate
     pollen
     cats))

(defun allergies (score)
  (lists:filter
    (lambda (allergen)
      (allergic-to? allergen score))
    (ALLERGIES)))

(defun allergic-to? (allergen score)
  (let ((index (index-of allergen (ALLERGIES))))
    (andalso (=/= 'not-found index)
             (> (band score (trunc (math:pow 2 index)))
                0.0))))

(defun index-of (allergen allergies) (index 0 allergies allergen))

(defun index
  ([index (cons allergen* _) allergen] (when (=:= allergen* allergen))
   index)
  ([index (cons _ allergies) allergen]
   (index (+ index 1) allergies allergen))
  ([_ '() _]
   'not-found))
