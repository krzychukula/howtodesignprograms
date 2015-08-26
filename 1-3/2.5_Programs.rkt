;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname 2.5_Programs) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
; 2.4 Global Constants

(define ALMOST-PI 3.14159)
 
; an empty scene:
(define MT (empty-scene 200 800))


(define WIDTH 100)
(define HEIGHT 200)
 
(define MID-WIDTH (/ WIDTH 2))
(define MID-HEIGHT (/ HEIGHT 2))



; 2.5 Programs

(require 2htdp/batch-io)
(write-file "sample.dat" "212")
(read-file "sample.dat")

(write-file 'stdout "212\n")


(define (f2c f)
  (* 5/9 (- f 32)))
(f2c 32)
(f2c 212)
(f2c -40)

(define (convert in out)
  (write-file out
              (string-append
               (number->string
                (f2c
                 (string->number
                  (read-file in))))
               "\n")))
(convert "sample.dat" 'stdout)
(convert "sample.dat" "out.dat")
(read-file "out.dat")


(define (number->square s)
  (square s "solid" "red"))

(number->square 5)

(require 2htdp/universe)
;(big-bang 100
;    [to-draw number->square]
;    [on-tick sub1]
;    [stop-when zero?])


(define (reset s ke)
  100)

;reset on every key
;(big-bang 100
;          [to-draw number->square]
;          [on-tick sub1]
;          [stop-when zero?]
;          [on-key reset])

(define (main y)
  (big-bang y
            [on-tick sub1]
            [stop-when zero?]
            [to-draw place-dot-at]
            [on-key stop]))

(define (place-dot-at y)
  (place-image (circle 3 "solid" "red") 50 y (empty-scene 100 100)))

(define (stop y ke)
  0)

(main 90)