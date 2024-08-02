(define-private (add-10 (x (optional int)))  
  (match x 
    value (+ 10 value)
    10))
(add-10 (some 5)) ;; Returns 15
(add-10 none) ;; Returns 10
(define-private (add-or-pass-err (x (response int (string-ascii 10))) (to-add int))  
  (match x
    value (ok (+ to-add value))
    err-value (err err-value)))
(add-or-pass-err (ok 5) 20) ;; Returns (ok 25)
(add-or-pass-err (err "ERROR") 20) ;; Returns (err "ERROR")