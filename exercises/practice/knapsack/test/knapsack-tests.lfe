(defmodule knapsack-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest no-items
  (is-equal 0 (knapsack:maximum-value [] 100)))

(deftest one-item-too-heavy
  (is-equal 0 
    (knapsack:maximum-value 
      (list
        (knapsack:new-item 100 1))
      10)))

(deftest five-items-cannot-be-greedy-by-weight
  (is-equal 21 
    (knapsack:maximum-value
      (list
        (knapsack:new-item 2 5)
        (knapsack:new-item 2 5)
        (knapsack:new-item 2 5)
        (knapsack:new-item 2 5)
        (knapsack:new-item 10 21))
      10)))

(deftest five-items-cannot-be-greedy-by-value
  (is-equal 80
    (knapsack:maximum-value
      (list
        (knapsack:new-item 2 20)
        (knapsack:new-item 2 20)
        (knapsack:new-item 2 20)
        (knapsack:new-item 2 20)
        (knapsack:new-item 10 50))
      10)))

(deftest example-knapsack
  (is-equal 90
    (knapsack:maximum-value
      (list
        (knapsack:new-item 5 10)
        (knapsack:new-item 4 40)
        (knapsack:new-item 6 30)
        (knapsack:new-item 4 50))
      10)))

(deftest 8-items
  (is-equal 900
    (knapsack:maximum-value
      (list
        (knapsack:new-item 25 350)
        (knapsack:new-item 35 400)
        (knapsack:new-item 45 450)
        (knapsack:new-item 5 20)
        (knapsack:new-item 25 70)
        (knapsack:new-item 3 8)
        (knapsack:new-item 2 5)
        (knapsack:new-item 2 5))
      104)))

(deftest 15-items
  (is-equal 1458
    (knapsack:maximum-value
      (list
        (knapsack:new-item 70 135)
        (knapsack:new-item 73 139)
        (knapsack:new-item 77 149)
        (knapsack:new-item 80 150)
        (knapsack:new-item 82 156)
        (knapsack:new-item 87 163)
        (knapsack:new-item 90 173)
        (knapsack:new-item 94 184)
        (knapsack:new-item 98 192)
        (knapsack:new-item 106 201)
        (knapsack:new-item 110 210)
        (knapsack:new-item 113 214)
        (knapsack:new-item 115 221)
        (knapsack:new-item 118 229)
        (knapsack:new-item 120 240))
      750)))