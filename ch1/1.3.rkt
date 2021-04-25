#lang racket

(define (square x)(* x x))
(define (sum-of-squares a b)(+ (square a) (square b)))
(define (sum-of-two-larger-numbers-squares a b c)(cond((and (or (> a b)(= a b))(or (> b c)(= b c)))(sum-of-squares a b))
                                                      ((and (or (> a b)(= a b))(or (> c b)(= b c)))(sum-of-squares a c))
                                                      (else (sum-of-squares b c))))