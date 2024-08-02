(define-public (try-example (input (response uint uint)))
    (begin
        (try! input)
        (ok "end of the function")
    )
)

(print (try-example (ok u1)))
(print (try-example (err u2)))
