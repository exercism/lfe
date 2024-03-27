(defmodule sieve
  (export (primes 1)))

(defun mark (n limit composite)
  (sets:union composite (sets:from_list (lists:seq (* n 2) limit n))))

(defun do-primes  
  ((limit limit primes composite) 
    (if (sets:is_element limit composite)
      primes
      (cons limit primes)))
  ((n limit primes composite) 
    (if (sets:is_element n composite) 
      (do-primes (+ n 1) limit primes composite)
      (do-primes (+ n 1) limit (cons n primes) (mark n limit composite)))))

(defun primes 
  ((limit) (when (< limit 2)) '())
  ((limit) (lists:reverse (do-primes 2 limit '() (sets:new)))))
