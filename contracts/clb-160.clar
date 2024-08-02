(define-map whitelisted-asset-contracts principal bool)

(define-read-only (is-whitelisted (asset-contract principal))
    (default-to false (map-get? whitelisted-asset-contracts asset-contract))
)

(define-public (set-whitelisted (asset-contract principal) (whitelisted bool))
    (begin
        (asserts! (is-eq contract-owner tx-sender) err-unauthorised)
        (ok (map-set whitelisted-asset-contracts asset-contract whitelisted))
    )
)
