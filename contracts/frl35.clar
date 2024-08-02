(impl-trait .nft-trait.nft-trait)

(define-non-fungible-token fun uint)

;; Storage
(define-map token-count principal uint)

;; Define Constants
(define-constant CONTRACT-OWNER tx-sender)

;; Define Variables
(define-data-var last-id uint u0)

;; Token count for account
(define-read-only (get-balance (account principal))
  (default-to u0
    (map-get? token-count account)))