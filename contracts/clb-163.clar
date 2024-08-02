(define-public (get-listing (id uint))
    (begin
        (ok (map-get? listings {id: id}))
    )
)