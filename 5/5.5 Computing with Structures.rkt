;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |5.5 Computing with Structures|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))

; STRUCT entry
(define-struct entry [name phone email])

(make-entry "Sarah Lee" "666-7771" "lee@classy-university.edu")




;(entry-name (make-posn 42 5))
;entry-name: expects an entry, given (posn 42 5)


(define-struct ball [location velocity])
(define-struct vel [deltax deltay])

(define ball1 (make-ball (make-posn 30 40) (make-vel -10 5)))

(ball-velocity ball1)
(vel-deltax (ball-velocity ball1))

;Exercise 70. Spell out the laws that the following structure type definitions introduce:
(define-struct centry [name home office cell])
(define-struct phone [area number])

;(centry-name (make-centry v1 v2 v3 v4)) == v1
;(phone-area (make-phone v1 v2)) == v1




; Predicates

(define a-posn (make-posn 7 0))
 
(define pl
  (make-entry "Sarah Lee" "666-7771" "lee@classy-university.edu"))

(posn? a-posn)
(posn? 42)
(posn? #true)
(posn? (make-posn 3 4))


(entry? pl)
(entry? 42)
(entry? #true)


;Exercise 71. Place the following definitions in DrRacket’s definition area:
(define HEIGHT 200)
(define MIDDLE (quotient HEIGHT 2))
(define WIDTH  400)
(define CENTER (quotient WIDTH 2))
 
(define-struct game [left-player right-player ball])
 
(define game0
  (make-game MIDDLE MIDDLE (make-posn CENTER CENTER)))

;Click RUN and evaluate the following expressions:
(game-ball game0)
(posn? (game-ball game0))
(game-left-player game0)

















