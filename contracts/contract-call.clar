;; instantiate the sample-contracts/tokens.clar contract first!
(as-contract (contract-call? .tokens mint! u19)) ;; Returns (ok u19)