(define-data-var even-values uint u0)

(define-public (count-even (number uint))
    (begin
        ;; increment the "event-values" variable by one.
        (var-set even-values (+ (var-get even-values) u1))
        
        ;; check if the input number is even (number mod 2 equals 0).
        (if (is-eq (mod number u2) u0)
            (ok "the number is even")
            (err "the number is uneven")
        )
    )
)

;; Call count-even two times.
(print (count-even u4))
(print (count-even u7))

;; Will this return u1 or u2?
(print (var-get even-values))
