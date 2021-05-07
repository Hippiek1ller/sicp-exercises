#lang racket

(define (square x)(* x x))
(define (improve-guess guess x)(/ (+(/ x (square guess))(* 2 guess)) 3))
(define (good-enough? guess x)(= guess (improve-guess guess x)))
(define (cube-iter guess x)(if(good-enough? guess x)
                              guess
                              (cube-iter(improve-guess guess x) x)))
(define (cbrt x)(cube-iter 1.0 x))
(cbrt 8)