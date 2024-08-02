(define-public (deposit (amount uint))
    (begin
        (map-set deposits tx-sender (+ (get-total-deposit tx-sender) amount))
        (stx-transfer? amount tx-sender (as-contract tx-sender))
    )
)
