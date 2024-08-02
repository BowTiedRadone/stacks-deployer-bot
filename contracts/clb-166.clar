(define-public (update-name (new-name (string-ascii 50)))
    (if (is-eq tx-sender contract-owner)
        (ok (var-set contract-name new-name))
        err-not-contract-owner
    )
)
