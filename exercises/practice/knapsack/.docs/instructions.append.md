The items are represented by [records](https://lfe.gitbooks.io/reference-guide/content/16.html), defined in `item.lfe`.
Use `item-weight` to get the weight and `item-value` to get the value. 

```
;; Create an item with weight=5, value=50
(set item (make-item weight 5 value 50))

;; Get the weight. Returns 5.
(item-weight item)

;; Get the value. Returns 50.
(item-value item)
```