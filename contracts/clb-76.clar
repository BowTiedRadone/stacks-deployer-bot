(define-public (count-up)
    (begin
        (map-set counters tx-sender (+ (get-count tx-sender) u1))
        (ok true)
    )
)
