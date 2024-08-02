(define-public (asserts-example (input bool))
    (begin
        (asserts! input (err "the assertion failed"))
        (ok "end of the function")
    )
)

(print (asserts-example true))
(print (asserts-example false))
