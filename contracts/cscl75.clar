;; constants & errors
(define-constant origin 'ST2ZXARHZ2VGGXYYA3C9W97NAGZVJB0RAFDCHNY6E)
(define-constant err-balance-too-low (err u1))
(define-constant err-limit-reached (err u2))

;; variables
(define-data-var margin-limit int 0)
(define-data-var margin int 0)
(define-data-var balance int 0)
(define-data-var daily-limit-deposit int 1000)
(define-data-var daily-limit-withdrawal int 5000)
(define-data-var transaction-time-b-height int 1)

;; get balance in wallet
(define-public (get-balance)
    (begin
      (var-set balance (to-int (stx-get-balance tx-sender)))
      (ok (var-get balance))
    )
)
;; set margin (and limit, automatically from balance)
(define-public (set-margin (new-margin int))
  (begin
    (var-set margin new-margin)
    (var-set margin-limit (/ (* (var-get balance) (var-get margin)) 100))
    (ok 1)
  )
)
;; incoming transaction
(define-public (incoming-transaction (amount int) (receiver principal))
  (begin
    (if (> (- (var-get balance) amount) (var-get margin-limit))
      (begin
        ;; (if (is-ok (stx-transfer? (to-uint amount) tx-sender receiver))
        ;;    (begin
        ;;       (get-balance)
        ;;       (ok (var-get balance))
        ;;    )
        ;;    err-balance-too-low
        ;; )
        (var-set balance (- (var-get balance) amount))
        (ok (var-get balance))
      )
      err-balance-too-low
    )
  )
)

(define-public (incoming-deposit (amount int))
    (begin
        (if (and (> amount 0) (< amount (var-get daily-limit-deposit)))
            (begin
                (var-set balance (+ (var-get balance) amount))
                ;; Daily limit needs to decrease accordingly
                ;; as more than one deposit can be made in a day but the
                ;; total of those deposits must be less than the limit
                (var-set daily-limit-deposit (- (var-get daily-limit-deposit) amount))
                (ok (var-get daily-limit-deposit))
            )
            err-limit-reached
        )
    )
)

(define-public (incoming-withdrawal (amount int))
    (begin
        (if (and (> amount 0) (< amount (var-get daily-limit-withdrawal)))
            (begin
                (var-set balance (- (var-get balance) amount))
                ;; Daily limit needs to decrease accordingly
                ;; as more than one withdrawal can be made in a day but the
                ;; total of those withdrawals must be less than the limit
                (var-set daily-limit-withdrawal (- (var-get daily-limit-withdrawal) amount))
                (ok (var-get daily-limit-withdrawal))
            )
            err-limit-reached
        )
    )
)