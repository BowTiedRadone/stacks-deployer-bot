(define-private (max-of (i1 int) (i2 int))  
  (if (> i1 i2)
    i1      
    i2))
(max-of 4 6) ;; Returns 6