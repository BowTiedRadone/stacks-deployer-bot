(define-read-only (get-count (who principal))
    (default-to u0 (map-get? counters who))
)
