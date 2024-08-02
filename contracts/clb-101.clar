(define-read-only (multiply (a uint) (b uint))
    (ok (* a b))
)

(define-read-only (divide (a uint) (b uint))
    (ok (/ a b))
)
