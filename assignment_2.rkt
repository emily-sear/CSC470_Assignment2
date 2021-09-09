;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname assignment_2) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Exercise 1.21
(define product
  (lambda (sos1 sos2)
    (if (null? sos1)
        '()
        (append (productHelper (car sos1) sos2) (product (cdr sos1) sos2)))))

(define productHelper
  (lambda (sym sos2)
    (if (null? sos2)
        '()
        (cons (list sym (car sos2)) (productHelper sym (cdr sos2))))))

(product '(a b c) '(x y))

; Exercise 1.22
(define filter-in
  (lambda (pred lst)
    (cond
      ((null? lst) '())
      ((pred (car lst)) (append (list(car lst)) (filter-in pred (cdr lst))))
      (else (filter-in pred (cdr lst))))))

(filter-in symbol? '(a (b c) 17 foo))

; Exercise 1.23
(define listIndexHelper
  (lambda (numStart pred lst)
    (cond
      ((null? lst) '#f)
      ((pred (car lst)) numStart)
      (else(listIndexHelper (+ numStart 1) pred (cdr lst))))))

(define list-index
  (lambda (pred lst)
    (listIndexHelper 0 pred lst)))

(list-index symbol? '(a (b c) 17 foo))