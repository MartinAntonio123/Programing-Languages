#lang racket
(define (power-head x y)
  (cond ((= y 0) 1)
        ((> y 0) (* x (power-head x (- y 1))))
        (else -1)
        ))
(define (power-tail x y acum)
  (cond ((= y 0) 1)
        ((= y 1) acum)
        ((> y 1) (power-tail x (- y 1) (* acum x)))
        (else -1)
        ))

(define (nelement n m lista)
  (cond ((= n m) (first lista))
        (else (nelement n (+ m 1) (rest lista)))
        ))

(define (third lista)
  (nelement 3 1 lista))

(define (just-n n m lista)
  (cond ((null? lista) (cond ((= n m) #t)
                                       (else #f)
                                  ))
        (else (just-n n (+ m 1) (rest lista)))
        ))

(define (just-two? lista)
  (just-n 2 0 lista))

(define (all-x x lista)
  (cond ((null? lista) #t)
        ((= (first lista) x) (all-x x (rest lista)))
        (else #f)))

(define (how-many? lista x y)
  (cond ((null? lista) y)
        ((= (first lista) x) (how-many? (rest lista) x (+ 1 y)))
        (else (how-many? (rest lista) x y))
        ))

(define (how-many-x? lista x)
  (how-many? lista x 0))

(define (getn list i j )
  (cond ((= i j) (first list))
        (else (getn (rest list) i (+ j 1)))))

(define (get list i)
  (getn list i 1))

(define (contains-x? x lista)
  (cond ((null? lista) #f)
        ((= (first lista) x) #t)
        (else (contains-x? x (rest lista)))))

(define (difference lista listb)
  (cond ((null? lista) empty)
        ((contains-x? (first lista) listb) (difference (rest lista) listb))
        (else (cons (first lista) (difference (rest lista) listb)))))

(define (append lista listb)
        (if (null? lista) listb
            (cons (first lista) (append (rest lista) listb))))

(define (inverta lista listb)
  (cond ((null? lista) listb)
        (else (inverta (rest lista) (cons (first lista) listb)))))

(define (invert lista)
  (inverta lista empty))

(define (sign lista)
  (cond ((null? lista) empty)
        ((> (first lista) 0) (cons 1 (sign (rest lista))))
        (else (cons -1 (sign (rest lista))))))

(define (negatives lista)
  (cond ((null? lista) empty)
        (else (cond ((<= (first lista) 1) (cons (first lista) (negatives (rest lista))))
                    (else (cons (- (first lista) (* 2 (first lista))) (negatives (rest lista)))))
         )))

(power-head 4 3)
(power-tail 4 3 4)
(third (cons 1(cons 2 (cons 3 (cons 4 (cons 5 empty))))))
(just-two? (cons 1 empty)) 
(just-two? (cons 1 (cons 4 empty)))
(define list (cons 1(cons 2 (cons 3 (cons 4 (cons 3 empty))))))
(how-many-x? list 3)  
(define list2 (cons 1(cons 2 (cons 3 (cons 4 (cons 3 empty))))))
(get list2 2) 
(get list2 5)
(difference '(12 44 55 77 66 1 2 3 4) '(1 2 3))
(append '(a b c d) '(e f g))
(invert '(a b c d))
(sign '(2 -4 -6))
(negatives '(2 -4 6))

;;class practice
(define (map op lista)
  (cond ((= lista '() ) '() )
        (else (cons (op (car lista))(map op(cdr lista))))))

(define (reduce op lista)
  (cond ((= lista '() ) '() )
        (else (+ (op (car lista))(map op(cdr lista))))))

                   