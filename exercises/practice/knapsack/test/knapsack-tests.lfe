(defmodule knapsack-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "include/item.lfe")
(include-lib "ltest/include/ltest-macros.lfe")

(deftest no-items
  (is-equal 0 (knapsack:maximum-value '() 100)))

(deftest one-item-too-heavy
  (is-equal 0
            (knapsack:maximum-value
              (list
                (make-item weight 100 value 1))
              10)))

(deftest five-items-cannot-be-greedy-by-weight
  (is-equal 21
            (knapsack:maximum-value
              (list
                (make-item weight 2 value 5)
                (make-item weight 2 value 5)
                (make-item weight 2 value 5)
                (make-item weight 2 value 5)
                (make-item weight 10 value 21))
              10)))

(deftest five-items-cannot-be-greedy-by-value
  (is-equal 80
            (knapsack:maximum-value
              (list
                (make-item weight 2 value 20)
                (make-item weight 2 value 20)
                (make-item weight 2 value 20)
                (make-item weight 2 value 20)
                (make-item weight 10 value 50))
              10)))

(deftest example-knapsack
  (is-equal 90
            (knapsack:maximum-value
              (list
                (make-item weight 5 value 10)
                (make-item weight 4 value 40)
                (make-item weight 6 value 30)
                (make-item weight 4 value 50))
              10)))

(deftest 8-items
  (is-equal 900
            (knapsack:maximum-value
              (list
                (make-item weight 25 value 350)
                (make-item weight 35 value 400)
                (make-item weight 45 value 450)
                (make-item weight 5 value 20)
                (make-item weight 25 value 70)
                (make-item weight 3 value 8)
                (make-item weight 2 value 5)
                (make-item weight 2 value 5))
              104)))

(deftest 15-items
  (is-equal 1458
            (knapsack:maximum-value
              (list
                (make-item weight 70 value 135)
                (make-item weight 73 value 139)
                (make-item weight 77 value 149)
                (make-item weight 80 value 150)
                (make-item weight 82 value 156)
                (make-item weight 87 value 163)
                (make-item weight 90 value 173)
                (make-item weight 94 value 184)
                (make-item weight 98 value 192)
                (make-item weight 106 value 201)
                (make-item weight 110 value 210)
                (make-item weight 113 value 214)
                (make-item weight 115 value 221)
                (make-item weight 118 value 229)
                (make-item weight 120 value 240))
              750)))
              