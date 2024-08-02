(define-fungible-token rocket-token)
(define-map balances
  { owner: principal }
  { balance: uint }
)
(define-data-var total-supply uint u30)

(define-constant err-min-transfer u1)