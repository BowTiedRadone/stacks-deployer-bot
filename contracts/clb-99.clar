(define-read-only (get-vote (member principal) (recipient principal))
    (default-to false (get decision (map-get? votes {member: member, recipient: recipient})))
)
