;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Exercise 66|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;Exercise 66. The Manhattan distance of a point to the origin considers a path that follows the rectangular grid of streets found in Manhattan.

; computes the distance of a-posn to the origin in a grid
(check-expect (distance-to-0 (make-posn 0 5)) 5)
(check-expect (distance-to-0 (make-posn 7 0)) 7)
(check-expect (distance-to-0 (make-posn 3 4)) 7)
(check-expect (distance-to-0 (make-posn 8 6)) 14)
(check-expect (distance-to-0 (make-posn 5 12)) 17)

(define (distance-to-0 a-posn)
   (+ (posn-x a-posn)
      (posn-y a-posn)))