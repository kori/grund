#lang racket

; knuth's up arrow notation
(provide up)

; d = depth
; a^b = (up 1 a b)
; a^^b = (up 2 a b) = (up (up 1 a b) a b)
; a^^^b = (up 3 a b) = (up (up (up 1 a b) a b) a b)
; and so on...
(define (up d a b)
   (if (equal? 1 d)
     (foldr * 1 (make-list b a))
     (up (- d 1) a (up (- d 1) a b))))
