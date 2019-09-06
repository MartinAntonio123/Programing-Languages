#lang racket

;;mutual recursion
;;helper function to check if a node is at the bottom of the tree
(define (leaf? tree)
  (cond
    [(empty? (cdr tree)) true]
    [else false]))

;;helper function to get children of a node (which are the rest of the anidated list)
(define (children tree)
  (cdr tree))

;;first call explores the depth of the tree
(define (count-leaves tree)
  (if (leaf? tree)
      1
      (count-leaves-in-forest (children tree))));;calls in-forest to explore the width (mutual recursion)

(define (count-leaves-in-forest forest)
  (if (null? forest)
      0
      (+ (count-leaves (car forest));;calls the count-leaves to explore depth (mutual recursion)
         (count-leaves-in-forest (cdr forest )))));;recursive call unto itself to explore the tree

(define (add-leaves tree)
  (if (leaf? tree)
      1
      (count-leaves-in-forest (children tree))))


(leaf? '(a (b (c) (d)) (e (f) (g))))
(count-leaves '(a (b (c) (d)) (e (f) (g))))
;;(add-leaves '(1 (b (c) (d)) (e (f) (g))))

(define (add-nodes tree)
  (if (leaf? tree)
      (first tree)
      (+ (first tree) (add-nodes-in-forest(children tree)))))

(define (add-nodes-in-forest forest)
  (if (null? forest)
      0
      (+ (add-nodes (car forest))
         (add-nodes-in-forest (cdr forest)))))

(add-nodes '(1(2)(3)))

(define (max-depth tree)
  (if (leaf? tree)
      1
      (+ 1 (max-depth-in-forest(children tree)))))

(define (max-depth-help a b)
  (if (> a b)
      a b))

(define (max-depth-in-forest forest)
  (if (null? forest)
      0
      (max-depth-help (max-depth (car forest))
         (max-depth-in-forest (cdr forest)))))

(max-depth '(1(2)(3)))