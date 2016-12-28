; TODO:
; 1. memoize the calls to collatz
; 1. cps the cons call because reverse is slow in the same way as length

(define collatz
  (lambda (n)
    (cond
      ((= n 1) 1)
      ((= 0 (remainder n 2)) (/ n 2))
      (else (+ 1 (* n 3))))))

(define collatz-path
  (letrec
    ((f (lambda (in out)
         (if (= in 1)
           (reverse out)
           (f (collatz in)
              (cons (collatz in) out))))))
   (lambda (n)
     (cons n (f n '())))))

(define collatz-length
  (letrec
    ((f (lambda (n cl)
          (if (= n 1)
            cl
            (f (collatz n)
               (+ cl 1))))))
    (lambda (n)
      (f n 0))))
