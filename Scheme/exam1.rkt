#lang racket
(define (leaf? tree)
  (if (null? (rest tree)) #t #f))

(define (bigest x y)
  (if (> x y) x y))

(define (bigest-val tree)
  (if (leaf? tree) (first tree)
      (bigest (first tree) (bigest-val-d(rest tree)))))

(define (bigest-val-d tree)
  (if (null? tree) 0
      (bigest (bigest-val(first tree)) (bigest-val-d(rest tree)))))

(bigest-val '(8(5(2)(7))(11(9))))
(bigest-val '(8(5(2)(7))))
(bigest-val '(8(5(2)(7))(11(9)(61))))