(define-read-only (get-balance (who principal))
    (ok (ft-get-balance clarity-coin who))
)
