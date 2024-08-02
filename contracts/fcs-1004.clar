(define-public (info (arg0 principal))
  (begin
    (print tx-sender)
    (print contract-caller)
    (print block-height)
    (print arg0)
    (ok true)
  )
)