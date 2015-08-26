;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise51) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;Exercise 51. A cond expression is really just an expression and may therefore show up in the middle of another expression:

;(define y 100)
(define y 210)

(- 200 (cond
         [(> y 200) 0]
         [else y]))


;Reformulate create-rocket-scene.v5 to use a nested expression; the resulting function mentions place-image only once.  image
(define (create-rocket-scene.v5 h)
  (place-image ROCKET 50
               (cond
                 [(<= h ROCKET-CENTER-TO-BOTTOM) h]
                 [(> h ROCKET-CENTER-TO-BOTTOM) ROCKET-CENTER-TO-BOTTOM])
               MTSCN)
