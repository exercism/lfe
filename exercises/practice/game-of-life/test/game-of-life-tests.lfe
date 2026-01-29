(defmodule game-of-life-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest empty-matrix
  (is-equal '()
            (game-of-life:tick '())))

(deftest live-cells-with-zero-live-neighbors-die
  (is-equal '((0 0 0)
              (0 0 0)
              (0 0 0))
            (game-of-life:tick '((0 0 0)
                                 (0 1 0)
                                 (0 0 0)))))

(deftest live-cells-with-only-one-live-neighbor-die
  (is-equal '((0 0 0)
              (0 0 0)
              (0 0 0))
            (game-of-life:tick '((0 0 0)
                                 (0 1 0)
                                 (0 1 0)))))

(deftest live-cells-with-two-live-neighbors-stay-alive
  (is-equal '((0 0 0)
              (1 0 1)
              (0 0 0))
            (game-of-life:tick '((1 0 1)
                                 (1 0 1)
                                 (1 0 1)))))

(deftest live-cells-with-three-live-neighbors-stay-alive
  (is-equal '((0 0 0)
              (1 0 0)
              (1 1 0))
            (game-of-life:tick '((0 1 0)
                                 (1 0 0)
                                 (1 1 0)))))

(deftest dead-cells-with-three-live-neighbors-become-alive
  (is-equal '((0 0 0)
              (1 1 0)
              (0 0 0))
            (game-of-life:tick '((1 1 0)
                                 (0 0 0)
                                 (1 0 0)))))

(deftest live-cells-with-four-or-more-neighbors-die
  (is-equal '((1 0 1) (0 0 0) (1 0 1))
            (game-of-life:tick '((1 1 1) (1 1 1) (1 1 1)))))

(deftest bigger-matrix
  (is-equal '((1 1 0 1 1 0 0 0)
              (0 0 0 0 0 1 1 0)
              (1 0 1 1 1 1 0 1)
              (1 0 0 0 0 0 0 1)
              (1 1 0 0 1 0 0 1)
              (1 1 0 1 0 0 0 1)
              (1 0 0 0 0 0 0 0)
              (0 0 0 0 0 0 1 1))
            (game-of-life:tick '((1 1 0 1 1 0 0 0)
                                 (1 0 1 1 0 0 0 0)
                                 (1 1 1 0 0 1 1 1)
                                 (0 0 0 0 0 1 1 0)
                                 (1 0 0 0 1 1 0 0)
                                 (1 1 0 0 0 1 1 1)
                                 (0 0 1 0 1 0 0 1)
                                 (1 0 0 0 0 0 1 1)))))
