;;; Storage
(define-map orderbook
  { buyer: principal }
  { rocket-id: uint, ordered-at-block: uint, ready-at-block: uint, balance: uint, size: uint }
)
(define-data-var last-rocket-id uint u0)