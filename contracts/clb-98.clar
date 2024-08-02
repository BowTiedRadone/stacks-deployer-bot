(define-public (vote (recipient principal) (decision bool))
    (begin
        (asserts! (is-some (index-of (var-get members) tx-sender)) err-not-a-member)
        (ok (map-set votes {member: tx-sender, recipient: recipient} {decision: decision}))
    )
)
