;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 67|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;Exercise 67. Write down the names of the functions (constructors, selectors, and predicates) that the following structure type definitions introduce:
(define-struct movie [title producer year])

(define-struct person [name hair eyes phone])

(define-struct pet [name number])

(define-struct CD [artist title price])

(define-struct sweater [material size producer])

(define m (make-movie 1 2 3))
(movie-title m)
(movie? m)

(define p (make-person 1 2 3 4))
(person-name p)
(person? p)

(define cd (make-CD 1 2 3))
(CD-artist cd)
(CD? cd)