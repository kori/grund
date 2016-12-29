; TODO:
; 1. memoize the calls to collatz
; 2. cps the cons call because reverse is slow in the same way as length

; n = which number to apply the collatz conjecture to
(define collatz
  (lambda (n)
    (cond
      ((= n 1) 1)
      ((= 0 (remainder n 2)) (/ n 2))
      (else (+ 1 (* n 3))))))

; n = initial number
(define collatz-path
  (lambda (n)
    (if (= 1 n)
      '(1)
      (cons n (collatz-path (collatz n))))))

; n = current number
; cl = current length
(define collatz-length
  (letrec
    ((f (lambda (n cl)
          (if (= n 1)
            cl
            (f (collatz n)
               (+ cl 1))))))
    (lambda (n)
      (f n 0))))
