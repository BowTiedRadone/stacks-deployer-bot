(define-trait ownable-trait (
  (get-owner (uint) (response (optional principal) uint))
))

(define-map user-profile principal {contract: principal, id: uint})
(define-map profile-user {contract: principal, id: uint} principal)
(define-map profile-blocked-period {contract: principal, id: uint} uint)

;; about 1 month
(define-constant blocking-period u4000)

(define-constant err-not-authorized (err u403))
(define-constant err-not-found (err u404))
(define-constant err-profile-blocked (err u500))
(define-constant err-invalid-profile (err u501))