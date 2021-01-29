(defmodule allergies-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest no-allergies-at-all (is-equal () (allergies:allergies 0)))

(deftest allergic-to-just-eggs (is-equal '(eggs) (allergies:allergies 1)))

(deftest allergic-to-just-peanuts (is-equal '(peanuts) (allergies:allergies 2)))

(deftest allergic-to-just-strawberries
  (is-equal '(strawberries) (allergies:allergies 8)))

(deftest allergic-to-eggs-and-peanuts
  (is-equal '(eggs peanuts) (allergies:allergies 3)))

(deftest allergic-to-more-than-eggs-but-not-peanuts
  (is-equal '(eggs shellfish) (allergies:allergies 5)))

(deftest allergic-to-lots-of-stuff
  (is-equal
    '(strawberries tomatoes chocolate pollen cats)
    (allergies:allergies 248)))

(deftest allergic-to-everything
  (is-equal
    '(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats)
    (allergies:allergies 255)))

(deftest no-allergies-means-not-allergic
  (is-not (allergies:allergic-to? 'peanuts 0))
  (is-not (allergies:allergic-to? 'cats 0))
  (is-not (allergies:allergic-to? 'strawberries 0)))

(deftest allergic-to-eggs? (is (allergies:allergic-to? 'eggs 1)))

(deftest allergic-to-eggs-and-other-stuff (is (allergies:allergic-to? 'eggs 5)))

(deftest ignore-non-allergen-score-parts
  (is-equal
    '(eggs shellfish strawberries tomatoes chocolate pollen cats)
    (allergies:allergies 509)))
