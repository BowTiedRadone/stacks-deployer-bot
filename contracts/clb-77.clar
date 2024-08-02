(define-public (count-up)
    (ok (map-set counters tx-sender (+ (get-count tx-sender) u1)))
)
