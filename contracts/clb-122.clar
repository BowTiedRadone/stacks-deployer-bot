(define-public (mint (recipient principal))
    (let
        (
            (token-id (+ (var-get last-token-id) u1))
        )
        (asserts! (is-eq tx-sender contract-owner) err-owner-only)
        (try! (nft-mint? stacksies token-id recipient))
        (var-set last-token-id token-id)
        (ok token-id)
    )
)
