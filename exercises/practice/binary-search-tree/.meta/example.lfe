(defmodule binary-search-tree
  (export (from-list 1)
          (sorted-data 1)))

(defun from-list (values)
  (lists:foldl #'insert/2 'empty-tree values))

(defun insert
  ((value 'empty-tree)
   `#(tree-node ,value empty-tree empty-tree))
  ((value `#(tree-node ,current ,left ,right))
   (if (=< value current)
       `#(tree-node ,current ,(insert value left) ,right)
       `#(tree-node ,current ,left ,(insert value right)))))

(defun sorted-data
  (('empty-tree) '())
  ((`#(tree-node ,value ,left ,right))
   (++ (sorted-data left)
       `(,value)
       (sorted-data right))))
