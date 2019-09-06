#lang scheme
;; LAB 1 A01701167
(define ( triangle-area base height) 
  (/ (* base height) 2))
(define (a n)
  (+ (* n n) 10))
(define (b n)
  (+ (* (* n n) 1/2) 20))
(define (c n)
  (- 2 (/ 1 n)))
(define (solutions-cuadratic a b c)
  (if (< (* 4 a c) (* b b)) "two" 
  (if (= (* 4 a c) (* b b)) "one" "no")))

(triangle-area 2 4)
(a 4)
(b 4)
(c 4)
(solutions-cuadratic 1 6 4)

;; EXERCISE 2:
;; FUNCTION WITH 3 VARIABLES
(define(op fn x y z)
(fn x y z))

(op + 1 2 3)

(op (lambda (x y z) (* x y z)) 1 2 2)

(define (op2 fn x y z)
  (if (< 0 x) (fn x y z) 0)
  (if (< 0 y) (fn x y z) 0)
  (if (< 0 z) (fn x y z) 0))

(op2 + 1 2 -10)