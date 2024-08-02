(impl-trait 'ST2PABAF9FTAJYNFZH93XENAJ8FVY99RRM4DF2YCW.nft-trait.nft-trait)
;;;; Rocket-Market

(define-non-fungible-token rocket uint)
(define-constant funds-address 'ST2PABAF9FTAJYNFZH93XENAJ8FVY99RRM4DF2YCW)

;;; Storage
(define-data-var last-rocket-id uint u0)

(define-map rockets-count
  principal uint)
(define-map factory-address
  int principal)
(define-map rockets-details
  uint {created-at: uint, size: uint})