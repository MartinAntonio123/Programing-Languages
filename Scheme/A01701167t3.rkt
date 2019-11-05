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
  (cond ((null? lista) lista)
        ((list? (car lista)) (append (deep-reverse (cdr lista)) (cons (deep-reverse (car lista)) '())))
        (else (append (deep-reverse (cdr lista)) (list (car lista))))))
                             
(define (my-flatten lista)
  (cond ((null? lista) '())
        ((pair? lista) (append (my-flatten (car lista)) (my-flatten (cdr lista))))
        (else (list lista))))

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
  (if (leaf? tree)
      1
      (max-arity (children tree))))

(define (max-arity forest)
  (if (null? forest)
      0
      (if (leaf? (first forest))
          (max-depth-help (count-levels (car forest))(max-depth (cdr forest)))
          (+ 1 (count-max-arity (car forest))(max-arity (cdr forest))))))

  

(deep-reverse '(a (b (c d)) e (f g)))
(my-flatten '(a (b (c d)) e (f g)))
(count-levels '(a(b (c) (d)) (e (f) (g))))
(count-max-arity '(a (b (c) (d))(e (f) (g) (h) (i))))
(count-max-arity '(a (b (c) (d))))