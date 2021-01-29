(defmodule beer-song-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest verse
  (compare-nested-lists
    (beer-song:verse 8)
    (++ "8 bottles of beer on the wall, 8 bottles of beer.\n"
        "Take it down and pass it around, 7 bottles of beer on the wall.\n")))

(defun compare-nested-lists (response expected)
  (is-equal (lists:flatten expected) (lists:flatten response)))

(deftest verse-0
  (compare-nested-lists
    (beer-song:verse 0)
    (++ "No more bottles of beer on the wall, no more bottles of beer.\n"
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n")))

(deftest verse-1
  (compare-nested-lists
    (beer-song:verse 1)
    (++ "1 bottle of beer on the wall, 1 bottle of beer.\n"
        "Take it down and pass it around, no more bottles of beer on the wall.\n")))

(deftest verse-2
  (compare-nested-lists
    (beer-song:verse 2)
    (++ "2 bottles of beer on the wall, 2 bottles of beer.\n"
        "Take it down and pass it around, 1 bottle of beer on the wall.\n")))

(deftest singing-several-verses
  (compare-nested-lists
    (beer-song:sing 8 6)
    (++ "8 bottles of beer on the wall, 8 bottles of beer.\n"
        "Take it down and pass it around, 7 bottles of beer on the wall.\n\n"

        "7 bottles of beer on the wall, 7 bottles of beer.\n"
        "Take it down and pass it around, 6 bottles of beer on the wall.\n\n"

        "6 bottles of beer on the wall, 6 bottles of beer.\n"
        "Take it down and pass it around, 5 bottles of beer on the wall.\n\n")))

(deftest sing-all-the-rest-of-the-verses
  (compare-nested-lists
    (beer-song:sing 3)
    (++ "3 bottles of beer on the wall, 3 bottles of beer.\n"
        "Take it down and pass it around, 2 bottles of beer on the wall.\n\n"

        "2 bottles of beer on the wall, 2 bottles of beer.\n"
        "Take it down and pass it around, 1 bottle of beer on the wall.\n\n"

        "1 bottle of beer on the wall, 1 bottle of beer.\n"
        "Take it down and pass it around, no more bottles of beer on the wall.\n\n"

        "No more bottles of beer on the wall, no more bottles of beer.\n"
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n\n")))
