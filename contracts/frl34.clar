(define-map tokens ((token-id uint))
  ((last-tick uint))
)

(define-non-fungible-token perishable-token uint)
(define-data-var next-id uint u1)

(define-constant time-to-perish u6)

(define-constant err-invalid-token-id u1)
(define-constant err-token-exists u2)
(define-constant err-token-perished u3)