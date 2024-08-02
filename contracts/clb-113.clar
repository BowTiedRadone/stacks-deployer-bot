;; Define my-awesome-token
(define-non-fungible-token my-awesome-token uint)

;; Mint NFT with ID u1 and give it to tx-sender.
(nft-mint? my-awesome-token u1 tx-sender)

;; Transfer the NFT with ID u1 from tx-sender to another principal.
(nft-transfer? my-awesome-token u1 tx-sender 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK)

;; Get and print the new owner of the NFT with ID u1.
(print (nft-get-owner? my-awesome-token u1))

;; Burn the NFT with ID u1 (destroys it)
(nft-burn? my-awesome-token u1 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK)
