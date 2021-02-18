(defmodule beer-song
  (export (verse 1)
          (sing 1)
          (sing 2)))

(defun bottles
  ([0] "no more bottles")
  ([1] "1 bottle")
  ([n] (io_lib:format "~B bottles" `(,n))))

;; -spec verse(non_neg_integer()) -> iolist().
(defun verse
  ([0]
   (++ "No more bottles of beer on the wall, no more bottles of beer.\n"
       "Go to the store and buy some more, 99 bottles of beer on the wall.\n"))
  ([n] (when (andalso (is_integer n) (=< 0 n)))
   (io_lib:format
     (++ "~s of beer on the wall, ~s of beer.\n"
         "Take it down and pass it around, ~s of beer on the wall.\n")
     `(,(bottles n) ,(bottles n) ,(bottles (- n 1))))))

;; -spec sing(non_neg_integer()) -> iolist().
(defun sing
  ([n] (when (andalso (is_integer n) (=< 0 n)))
   (sing n 0)))

(defun sing (from to)
  (lists:map (lambda (n) `(,(verse n) "\n")) (lists:seq from to -1)))
