;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.6 Programming with Structures|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))

(define-struct entry [name phone email])
; An Entry is a structure: (make-entry String String String)
; interpretation a contact's name, 7-digit phone#, and email address

;Exercise 72. Formulate a data definition for the above phone structure type definition that accommodates the given examples.

; no idea what this is about...



;Next formulate a data definition for phone numbers using this structure type definition:
(define-struct phone# [area switch num])
; A Phone# is a structure: (make-phone# Number String Number)
; interpretation creates phone number with area switch and number

