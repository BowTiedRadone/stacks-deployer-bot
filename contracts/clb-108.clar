(define-public (claim-wallet (wallet-contract <locked-wallet-trait>))
    (ok (try! (as-contract (contract-call? wallet-contract claim))))
)
