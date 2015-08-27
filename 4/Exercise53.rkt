;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise53) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;Exercise 53. Design a big-bang program that simulates a traffic light for a given duration. The program renders the state of a traffic light as a solid circle of the appropriate color, and it changes state on every clock tick. What is the most appropriate initial state? Ask your engineering friends. image

(require 2htdp/universe)

(define radius 50)
(define scene (empty-scene (* radius 2) (* radius 2)))

; WorldState -> WorldState
; updates world state index
(define (tock w)
  (- w 1))

; WorldState -> Image
; draw image for the given state
(define (draw w)
  (place-image (light w) radius radius scene))

; WorldState -> Image
; Circle with color from world state
(define (light w)
  (circle radius "solid" (light-color w)))

; WorldState -> TrafficLight
; determines the next state of the traffic light from the given x
(define (light-color w)
  (cond
    [(= (get-id w) 0) "yellow"]
    [(= (get-id w) 1) "red"]
    [(= (get-id w) 2) "green"]))

; WorldState -> Integer
; - 1, 2 3
; determines the next state of the traffic light from the given x
(define (get-id w)
  (modulo w 3))

; WorldState - Boolean
; check if should stop
;(define (zero? w)
;  (<= w 0))

(define (main duration)
  (big-bang duration
   [on-tick tock]
   [to-draw draw]
   [stop-when zero?]))

(main 300)


; no idea how to use real enumeration here without having both color and numerical world state for duration.
; above I've used x for world state duration and used it to calcuate color
; alternative would be to use color as world state but then there is no way to count the duration of the program. 