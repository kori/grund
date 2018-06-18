#lang racket

(provide flatten)

(define (atom? x)
  (and (not (pair? x))
       (not (null? x))))

(define (flatten l)
  (let aux ((in l) (out '()))
    (cond
      [(null? in) (reverse out)]
      [(atom? in) (cons in out)]
      [else (append (aux (car in) out) (aux (cdr in) '()))])))
