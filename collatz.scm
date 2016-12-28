; memoize the calls to collatz
; cps the cons call because reverse is slow in the same way as length

(define collatz
  (lambda (n)
    (cond
      ((= n 1) 1)
      ((= 0 (remainder n 2)) (/ n 2))
      (else (+ 1 (* n 3))))))

(define collatz-path
  (letrec
    ((f (lambda (in out cl)
         (if (= in 1)
           (reverse out)
           (f (collatz in)
              (cons (collatz in) out)
              (+ cl 1))))))
   (lambda (n)
     (f n '() 0))))

(define collatz-length
  (letrec
    ((f (lambda (n cl)
          (if (= n 1)
            cl
            (f (collatz n)
               (+ cl 1))))))
    (lambda (n)
      (f n 0))))
