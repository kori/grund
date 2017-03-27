; knuth's up arrow notation

; n = number
; c = counter
(define (repeat n c)
  (let aux ((in c) (out '()))
    (if (zero? in)
      out
      (aux (- in 1) (cons n out)))))

; d = depth
; (up 1 a b) = a^b
; (up 2 a b) = a^^b  = (up (up 1 a b) a b)
; (up 3 a b) = a^^^b = (up (up (up 1 a b) a b) a b)

; and so on...
(define (up d a b)
  (if (equal? 1 d)
    (apply * (repeat a b))
    (up (- d 1) a (up (- d 1) a b))))
