(defmodule binary-search-tree-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest data-is-retained
  (is-equal '#(tree-node 4 empty-tree empty-tree)
            (binary-search-tree:from-list '(4))))

(deftest insert-data-at-proper-node-smaller-number-at-left-node
  (let ((expected '#(tree-node 4
                     #(tree-node 2 empty-tree empty-tree)
                     empty-tree)))
    (is-equal expected
              (binary-search-tree:from-list '(4 2)))))

(deftest insert-data-at-proper-node-same-number-at-left-node
  (let ((expected '#(tree-node 4
                     #(tree-node 4 empty-tree empty-tree)
                     empty-tree)))
    (is-equal expected
              (binary-search-tree:from-list '(4 4)))))

(deftest insert-data-at-proper-node-greater-number-at-right-node
  (let ((expected '#(tree-node 4
                     empty-tree
                     #(tree-node 5 empty-tree empty-tree))))
    (is-equal expected
              (binary-search-tree:from-list '(4 5)))))

(deftest can-create-complex-tree
  (let ((expected '#(tree-node 4
                     #(tree-node 2
                       #(tree-node 1 empty-tree empty-tree)
                       #(tree-node 3 empty-tree empty-tree))
                     #(tree-node 6
                       #(tree-node 5 empty-tree empty-tree)
                       #(tree-node 7 empty-tree empty-tree)))))
    (is-equal expected
              (binary-search-tree:from-list '(4 2 6 1 3 5 7)))))

(deftest can-sort-data-can-sort-single-number
  (is-equal '(2)
            (binary-search-tree:sorted-data
             (binary-search-tree:from-list '(2)))))

(deftest can-sort-data-can-sort-if-second-number-is-smaller-than-first
  (is-equal '(1 2)
            (binary-search-tree:sorted-data
             (binary-search-tree:from-list '(2 1)))))

(deftest can-sort-data-can-sort-if-second-number-is-same-as-first
  (is-equal '(2 2)
            (binary-search-tree:sorted-data
             (binary-search-tree:from-list '(2 2)))))

(deftest can-sort-data-can-sort-if-second-number-is-greater-than-first
  (is-equal '(2 3)
            (binary-search-tree:sorted-data
             (binary-search-tree:from-list '(2 3)))))

(deftest can-sort-data-can-sort-complex-tree
  (is-equal '(1 2 3 5 6 7)
            (binary-search-tree:sorted-data
             (binary-search-tree:from-list '(2 1 3 6 7 5)))))
