(use-trait src20-token 'ST000000000000000000002AMW42H.sip-010.ft-trait)
(use-trait swapr-token 'ST000000000000000000002AMW42H.swapr-trait.swapr-trait)

(define-constant contract-owner 'ST3J2GVMMM2R07ZFBJDWTYEYAR8FZH5WKDTFJ9AHA)
(define-constant no-liquidity-err (err u61))
(define-constant transfer-failed-err (err u62))
(define-constant not-owner-err (err u63))
(define-constant no-fee-to-address-err (err u64))
(define-constant invalid-pair-err (err u65))
(define-constant no-such-position-err (err u66))
(define-constant balance-too-low-err (err u67))
(define-constant too-many-pairs-err (err u68))
(define-constant pair-already-exists-err (err u69))
(define-constant wrong-token-err (err u70))
(define-constant too-much-slippage-err (err u71))

;; for future use, or debug
(define-constant e10-err (err u20))
(define-constant e11-err (err u21))
(define-constant e12-err (err u22))

(define-map pairs-map
  { pair-id: uint }
  {
    token-x: principal,
    token-y: principal,
  }
)

(define-map pairs-data-map
  {
    token-x: principal,
    token-y: principal,
  }
  {
    shares-total: uint,
    fee-balance-x: uint,
    fee-balance-y: uint,
    fee-to-address: (optional principal),
    swapr-token: principal,
    name: (string-ascii 32),
  }
)