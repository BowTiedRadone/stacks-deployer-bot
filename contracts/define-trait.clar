(define-trait token-trait    
  ((transfer? (principal principal uint) (response uint uint)) 
  (get-balance (principal) (response uint uint))))