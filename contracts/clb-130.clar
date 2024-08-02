(define-public (transfer (amount uint) (sender principal) (recipient principal) (memo (optional (buff 34))))
    (begin
        (asserts! (is-eq tx-sender sender) err-not-token-owner)
        (try! (ft-transfer? clarity-coin amount sender recipient))
        (match memo to-print (print to-print) 0x)
        (ok true)
    )
)
