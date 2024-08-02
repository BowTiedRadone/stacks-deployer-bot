(define-read-only (get-owner (token-id uint))
    (ok (nft-get-owner? stacksies token-id))
)
