(define-map deposits principal uint)

(define-read-only (get-total-deposit (who principal))
    (default-to u0 (map-get? deposits who))
)

(define-public (deposit (amount uint))
    (begin
        (stx-transfer? amount tx-sender (as-contract tx-sender))
        (map-set deposits tx-sender (+ (get-total-deposit tx-sender) amount))
        (ok true)
    )
)

;; Try a test deposit
(print (deposit u500))
