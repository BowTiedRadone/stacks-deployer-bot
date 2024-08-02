(define-public (update-name (new-name (string-ascii 50)))
    (begin
        (asserts! (is-eq tx-sender contract-owner) err-not-contract-owner)
        (ok (var-set contract-name new-name))
    )
)
