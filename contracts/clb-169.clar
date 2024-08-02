(define-public (transfer (token-id uint) (sender principal) (recipient principal))
    (begin
        (asserts! (is-eq tx-sender sender) (err u500))
        (nft-transfer? my-nft token-id sender recipient)
    )
)
