;; define counter variable
(define-data-var counter int 0)
;; increment counter method
(define-public (increment)
   (begin
     (var-set counter (+ (var-get counter) 1))
       (ok (var-get counter))))
;; decrement counter method
(define-public (decrement)
   (begin
     (var-set counter (- (var-get counter) 1))
       (ok (var-get counter))))
;; even or odd method
(define-read-only (even-odd) ;; read-only mode
     (if (is-eq (mod (var-get counter) 2) 0) (print "Even") (print "Odd"))) ;; check if remainder is zero for even and odd when divided by 2
;; counter getter
(define-read-only (get-counter) ;; read-only mode
   (ok (var-get counter)))