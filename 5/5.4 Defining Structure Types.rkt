;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.4 Defining Structure Types|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))

(define-struct new-posn [x y])

(make-new-posn 1 2)
(new-posn-x (make-new-posn 1 2))
(new-posn? (make-new-posn 1 2))


; STRUCT entry
(define-struct entry [name phone email])

(define pl
  (make-entry "Sarah Lee" "666-7771" "lee@classy-university.edu"))
 
(define bh
  (make-entry "Tara Harper" "666-7770" "harper@small-college.edu"))

(entry-name pl)
(entry-name bh)
(entry-email pl)
(entry-phone pl)


(define-struct ball [location velocity])

(make-ball 10 -3)

;Exercise 68. There are other ways to represent bouncing balls. Here is one:
(define SPEED 3)
(define-struct balld [location direction])
(make-balld 10 "up")
;Interpret this program fragment and then create other instances of balld. image

; Speed is constant but depending on direction it's multiplied by 1 or -1.
; direction:
; - "up"
; - "down"


(define-struct vel [deltax deltay])

(define ball1 (make-ball (make-posn 30 40) (make-vel -10 5)))

;Exercise 69. Here is an alternative to the nested data representation of balls:
(define-struct ballf [x y deltax deltay])

;Programmers often call this a flat representation. Create an instance of ballf that has the same interpretation as ball1. image

(define ball2 (make-ballf 30 40 -10 5))



(define-struct centry [name home office cell])

(define-struct phone [area number])

(make-centry "Shriram Fisler"
             (make-phone 207 "363-241")
             (make-phone 101 "777-333")
             (make-phone 208 "444-222"))

