#lang racket

;;helper function to check if a node is at the bottom of the tree
(define (leaf? tree)
  (cond
    [(empty? (cdr tree)) true]
    [else false]))

;;helper function to get children of a node
(define (children tree)
  (cdr tree))

(define (deep-reverse lista)
  (cond ((null? lista) '())
        ((pair? lista) (cons (deep-reverse (cdr lista)) (deep-reverse (car lista))))
        (else (list lista))))

(define (my-flatten lst)
  (cond ((null? lst) '())
        ((pair? lst) (append (my-flatten (car lst)) (my-flatten (cdr lst))))
        (else (list lst))))

(define (count-levels tree)
  (if (leaf? tree)
      1
      (+ 1 (max-depth(children tree)))))

(define (max-depth-help a b)
  (if (> a b)
      a b))

(define (max-depth forest)
  (if (null? forest)
      0
      (max-depth-help (count-levels (car forest))
         (max-depth (cdr forest)))))

(define (count-max-arity tree)
  empty )
  

(deep-reverse '(a (b (c d)) e (f g)))
(my-flatten '(a (b (c d)) e (f g)))
(count-levels '(a(b (c) (d)) (e (f) (g))))
(count-max-arity '(a (b (c) (d))(e (f) (g) (h) (i)))) 