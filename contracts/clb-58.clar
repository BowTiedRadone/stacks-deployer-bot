(define-data-var counter uint u0)

(define-read-only (increment-counter)
    (var-set (+ (var-get counter) u1))
)

(print (increment-counter))
