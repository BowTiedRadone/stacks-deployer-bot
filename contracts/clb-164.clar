(define-public (get-listing (id uint))
    (ok (map-get? listings {id: id}))
)