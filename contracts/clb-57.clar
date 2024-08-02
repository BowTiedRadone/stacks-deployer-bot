(define-data-var counter uint u0)

(define-read-only (get-counter-value)
    (var-get counter)
)

(print (get-counter-value))
