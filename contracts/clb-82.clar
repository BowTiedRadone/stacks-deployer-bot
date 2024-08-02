(define-public (bestow (new-beneficiary principal))
    (begin
        (asserts! (is-eq (some tx-sender) (var-get beneficiary)) err-beneficiary-only)
        (var-set beneficiary (some new-beneficiary))
        (ok true)
    )
)
