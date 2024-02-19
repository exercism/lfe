(defmodule list-ops
  (export 
    (append 2) 
    (concat 1) 
    (filter 2)
    (length 1)
    (map 2)
    (foldl 3)
    (foldr 3)
    (reverse 1)
  )
)

(defun append (list1 list2) (append-loop (reverse list1) list2))
(defun append-loop
  ((list1 []) (reverse list1))
  ((list1 (cons next tail)) (append-loop (cons next list1) tail)))

(defun concat (content) (concat-loop content '()))
(defun concat-loop 
  (('() acc) acc)
  (((cons next tail) acc) (concat-loop tail (append acc next))))

(defun filter (content filter-func)
  (filter content '() filter-func)
)

(defun filter 
  (('() acc filter-func) (lists:reverse acc))
  (((cons next tail) acc filter-func)
    (if (funcall filter-func next)
      (filter tail (cons next acc) filter-func)
      (filter tail acc filter-func)
    )
  )
)

(defun length (contents) (foldl-loop contents 0 (lambda (acc item) (+ acc 1))))

(defun map (contents map-func)
  (map-loop contents '() map-func)
)
(defun map-loop 
  (('() acc map-func) (reverse acc))
  (((cons next tail) acc map-func) (map-loop tail (cons (funcall map-func next) acc) map-func))
)

(defun foldl (contents initial fold-func) (foldl-loop contents initial fold-func))

(defun foldr (contents initial fold-func) (foldl-loop (reverse contents) initial fold-func))

(defun foldl-loop 
  (('() acc fold-func) acc)
  (((cons head tail) acc fold-func) (foldl-loop tail (funcall fold-func acc head) fold-func))
)

(defun reverse (contents) (reverse-loop contents '()))
(defun reverse-loop
  (('() reversed) reversed)
  (((cons next tail) acc) (reverse-loop tail (cons next acc)))
)
