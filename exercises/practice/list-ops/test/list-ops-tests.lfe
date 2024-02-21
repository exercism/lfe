(defmodule list-ops-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest append-empty-lists
  (is-equal '() (list-ops:append '() '())))

(deftest append-list-to-empty-list 
  (is-equal '(1 2 3 4) (list-ops:append '() '(1 2 3 4))))

(deftest append-empty-list-to-list 
  (is-equal '(1 2 3 4) (list-ops:append '(1 2 3 4) '())))

(deftest append-non-empty-lists
  (is-equal '(1 2 2 3 4 5) (list-ops:append '(1 2) '(2 3 4 5))))

(deftest concat-empty-list
  (is-equal '() (list-ops:concat '())))

(deftest concat-list-of-lists
  (is-equal '(1 2 3 4 5 6) (list-ops:concat (list (list 1 2) (list 3) '() (list 4 5 6)))))

(deftest concat-list-of-nested-lists
  (is-equal (list (list 1) (list 2) (list 3) '() (list 4 5 6)) (list-ops:concat (list (list (list 1) (list 2)) (list (list 3)) (list '()) (list (list 4 5 6))))))

(deftest filter-empty-list
  (is-equal '() (list-ops:filter '() (lambda (x) (== (rem x 2) 1)))))

(deftest filter-non-empty-list
  (is-equal '(1 3 5) (list-ops:filter '(1 2 3 5) (lambda (x) (== (rem x 2) 1)))))

(deftest length-empty-list
  (is-equal 0 (list-ops:length '())))

(deftest length-non-empty-list
  (is-equal 4 (list-ops:length `(1 2 3 4))))

(deftest map-empty-list
  (is-equal '() (list-ops:map '() (lambda (x) (+ x 1)))))

(deftest map-non-empty-list
  (is-equal '(2 4 6 8) (list-ops:map '(1 3 5 7) (lambda (x) (+ x 1)))))

(deftest foldl-empty-list
  (is-equal 2 (list-ops:foldl '() 2 (lambda (acc el) (* acc el)))))

(deftest foldl-direction-independent-function-applied-to-non-empty-list
  (is-equal 15 (list-ops:foldl '(1 2 3 4) 5 (lambda (acc el) (+ acc el)))))

(deftest foldl-direction-dependent-function-applied-to-non-empty-list
  (is-equal 64.0 (list-ops:foldl '(1 2 3 4) 24 (lambda (acc el) (/ el acc)))))

(deftest foldr-empty-list
  (is-equal 2 (list-ops:foldr '() 2 (lambda (acc el) (* el acc)))))

(deftest foldr-direction-independent-function-applied-to-non-empty-list
  (is-equal 15 (list-ops:foldr '(1 2 3 4) 5 (lambda (acc el) (+ el acc)))))

(deftest foldr-direction-dependent-function-applied-to-non-empty-list
  (is-equal 9.0 (list-ops:foldr '(1 2 3 4) 24 (lambda (acc el) (/ el acc)))))

(deftest reverse-empty-list
  (is-equal '() (list-ops:reverse '())))

(deftest reverse-non-empty-list
  (is-equal '(7 5 3 1) (list-ops:reverse '(1 3 5 7))))

(deftest reverse-list-of-lists-is-not-flattened
  (is-equal (list '(4 5 6) '() '(3) '(1 2)) (list-ops:reverse (list '(1 2) '(3) '() '(4 5 6)))))
