;; Define clarity-coin with a maximum of 1,000,000 tokens.
(define-fungible-token clarity-coin u1000000)

;; Mint 1,000 tokens and give them to tx-sender.
(ft-mint? clarity-coin u1000 tx-sender)

;; Transfer 500 tokens from tx-sender to another principal.
(ft-transfer? clarity-coin u500 tx-sender 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK)

;; Get and print the token balance of tx-sender.
(print (ft-get-balance clarity-coin tx-sender))

;; Burn 250 tokens (destroys them)
(ft-burn? clarity-coin u250 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK)

;; Get and print the circulating supply
(print (ft-get-supply clarity-coin))
