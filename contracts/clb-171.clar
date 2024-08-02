(define-map jobs
    uint
    {
        poster: principal,
        data-hash: (buff 32)
    }
)

(define-read-only (get-job-hash (job-id uint))
    (get data-hash (map-get? jobs job-id))
)

(define-public (update-job-posting (job-id uint) (new-data-hash (buff 32)))
    (begin
        (asserts! (is-eq (get poster (map-get? jobs job-id)) (some tx-sender)) (err u100)) ;; not the poster
        (ok (map-set jobs job-id {poster: tx-sender, data-hash: new-data-hash}))
    )
)
