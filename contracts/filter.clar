(filter not (list true false true false)) ;; Returns (false false)
(define-private (is-a (char (string-utf8 1))) 
  (is-eq char u"a"))
(filter is-a u"acabd") ;; Returns u"aa"
(define-private (is-zero (char (buff 1)))
  (is-eq char 0x00))
(filter is-zero 0x00010002) ;; Returns 0x0000