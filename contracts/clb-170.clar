(define-map jobs
    uint
    {
        poster: principal,
        title: (string-utf8 200),
        description: (string-utf8 10000),
        posting-date: (string-utf8 12),
        expiry-date: (string-utf8 12),
        vacancies: uint,
        salary-range-lower: uint,
        salary-range-upper: uint
        ;; And so on...
    }
)
