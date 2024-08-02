(define-fungible-token rocket-token)

(define-constant err-min-transfer u10)

(define-public (get-total-supply)
  (ok (ft-get-supply rocket-token))
)

(define-read-only (get-balance (account principal))
  (ok
    (ft-get-balance rocket-token account)
  )
)