(define-public (sum-three (a uint) (b uint) (c uint))
  (+ a b c)
)

(print (sum-three u3 u5 u9))

(asserts! (is-eq (sum-three u3 u5 u7) (ok u15)) "That does not seem right, try again...")
(asserts! (is-eq (sum-three u20 u30 u40) (ok u90)) "Almost there, try again!")