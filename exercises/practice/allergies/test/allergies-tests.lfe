(defmodule allergies-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

;;; testing for eggs allergy


(deftest eggs-not-allergic-to-anything
  (is-not (allergies:allergic-to? 'eggs 0)))

(deftest eggs-allergic-only-to-eggs
  (is (allergies:allergic-to? 'eggs 1)))

(deftest eggs-allergic-to-eggs-and-something-else
  (is (allergies:allergic-to? 'eggs 3)))

(deftest eggs-allergic-to-something-but-not-eggs
  (is-not (allergies:allergic-to? 'eggs 2)))

(deftest eggs-allergic-to-everything
  (is (allergies:allergic-to? 'eggs 255)))


;;; testing for peanuts allergy


(deftest peanuts-not-allergic-to-anything
  (is-not (allergies:allergic-to? 'peanuts 0)))

(deftest peanuts-allergic-only-to-peanuts
  (is (allergies:allergic-to? 'peanuts 2)))

(deftest peanuts-allergic-to-peanuts-and-something-else
  (is (allergies:allergic-to? 'peanuts 7)))

(deftest peanuts-allergic-to-something-but-not-peanuts
  (is-not (allergies:allergic-to? 'peanuts 5)))

(deftest peanuts-allergic-to-everything
  (is (allergies:allergic-to? 'peanuts 255)))


;;; testing for shellfish allergy


(deftest shellfish-not-allergic-to-anything
  (is-not (allergies:allergic-to? 'shellfish 0)))

(deftest shellfish-allergic-only-to-shellfish
  (is (allergies:allergic-to? 'shellfish 4)))

(deftest shellfish-allergic-to-shellfish-and-something-else
  (is (allergies:allergic-to? 'shellfish 14)))

(deftest shellfish-allergic-to-something-but-not-shellfish
  (is-not (allergies:allergic-to? 'shellfish 10)))

(deftest shellfish-allergic-to-everything
  (is (allergies:allergic-to? 'shellfish 255)))


;;; testing for strawberries allergy


(deftest strawberries-not-allergic-to-anything
  (is-not (allergies:allergic-to? 'strawberries 0)))

(deftest strawberries-allergic-only-to-strawberries
  (is (allergies:allergic-to? 'strawberries 8)))

(deftest strawberries-allergic-to-strawberries-and-something-else
  (is (allergies:allergic-to? 'strawberries 28)))

(deftest strawberries-allergic-to-something-but-not-strawberries
  (is-not (allergies:allergic-to? 'strawberries 20)))

(deftest strawberries-allergic-to-everything
  (is (allergies:allergic-to? 'strawberries 255)))


;;; testing for tomatoes allergy


(deftest tomatoes-not-allergic-to-anything
  (is-not (allergies:allergic-to? 'tomatoes 0)))

(deftest tomatoes-allergic-only-to-tomatoes
  (is (allergies:allergic-to? 'tomatoes 16)))

(deftest tomatoes-allergic-to-tomatoes-and-something-else
  (is (allergies:allergic-to? 'tomatoes 56)))

(deftest tomatoes-allergic-to-something-but-not-tomatoes
  (is-not (allergies:allergic-to? 'tomatoes 40)))

(deftest tomatoes-allergic-to-everything
  (is (allergies:allergic-to? 'tomatoes 255)))


;;; testing for chocolate allergy


(deftest chocolate-not-allergic-to-anything
  (is-not (allergies:allergic-to? 'chocolate 0)))

(deftest chocolate-allergic-only-to-chocolate
  (is (allergies:allergic-to? 'chocolate 32)))

(deftest chocolate-allergic-to-chocolate-and-something-else
  (is (allergies:allergic-to? 'chocolate 112)))

(deftest chocolate-allergic-to-something-but-not-chocolate
  (is-not (allergies:allergic-to? 'chocolate 80)))

(deftest chocolate-allergic-to-everything
  (is (allergies:allergic-to? 'chocolate 255)))


;;; testing for pollen allergy


(deftest pollen-not-allergic-to-anything
  (is-not (allergies:allergic-to? 'pollen 0)))

(deftest pollen-allergic-only-to-pollen
  (is (allergies:allergic-to? 'pollen 64)))

(deftest pollen-allergic-to-pollen-and-something-else
  (is (allergies:allergic-to? 'pollen 224)))

(deftest pollen-allergic-to-something-but-not-pollen
  (is-not (allergies:allergic-to? 'pollen 160)))

(deftest pollen-allergic-to-everything
  (is (allergies:allergic-to? 'pollen 255)))


;;; testing for cats allergy


(deftest cats-not-allergic-to-anything
  (is-not (allergies:allergic-to? 'cats 0)))

(deftest cats-allergic-only-to-cats
  (is (allergies:allergic-to? 'cats 128)))

(deftest cats-allergic-to-cats-and-something-else
  (is (allergies:allergic-to? 'cats 192)))

(deftest cats-allergic-to-something-but-not-cats
  (is-not (allergies:allergic-to? 'cats 64)))

(deftest cats-allergic-to-everything
  (is (allergies:allergic-to? 'cats 255)))


;;; testing for list of allergies


(deftest list-when-no-allergies
  (is-equal '()
            (allergies:allergies 0)))

(deftest list-when-just-eggs
  (is-equal '(eggs)
            (allergies:allergies 1)))

(deftest list-when-just-peanuts
  (is-equal '(peanuts)
            (allergies:allergies 2)))

(deftest list-when-just-strawberries
  (is-equal '(strawberries)
            (allergies:allergies 8)))

(deftest list-when-eggs-and-peanuts
  (is-equal '(eggs peanuts)
            (allergies:allergies 3)))

(deftest list-when-more-than-eggs-but-not-peanuts
  (is-equal '(eggs shellfish)
            (allergies:allergies 5)))

(deftest list-when-lots-of-stuff
  (is-equal '(strawberries tomatoes chocolate pollen cats)
            (allergies:allergies 248)))

(deftest list-when-everything
  (is-equal '(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)
            (allergies:allergies 255)))

(deftest list-when-no-allergen-score-parts
  (is-equal '(eggs shellfish strawberries tomatoes chocolate pollen cats)
            (allergies:allergies 509)))

(deftest list-when-no-allergen-score-parts-without-highest-valid-score
  (is-equal '(eggs)
            (allergies:allergies 257)))
