;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise39) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define WIDTH-OF-WORLD 200)

(define WHEEL-RADIUS 5)

(define WHEEL-DISTANCE (* WHEEL-RADIUS 5))

(define WHEEL 
  (circle WHEEL-RADIUS "solid" "black"))

(define SPACE 
  (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))

(define CAR-BODY-WIDTH
  (+ WHEEL-DISTANCE (* WHEEL-RADIUS 6)))

(define CAR-BODY
  (rectangle CAR-BODY-WIDTH (* WHEEL-RADIUS 2) "solid" "red"))

(define BOTH-WHEELS 
  (beside WHEEL SPACE WHEEL))

(define CAR-HEAD
  (rectangle (+ WHEEL-DISTANCE
                (* WHEEL-RADIUS 2))
             WHEEL-RADIUS
             "solid"
             "red"))

(define CAR-BODY-WHELLS
  (overlay/offset BOTH-WHEELS
                  0 (- WHEEL-RADIUS)
                  CAR-BODY))

(define CAR
  (above CAR-HEAD CAR-BODY-WHELLS))


(define BACKGROUND (empty-scene 100 100))


; WorldState -> Image
; places the image of the car x pixels from 
; the left margin of the BACKGROUND image 
(define (render x)
  BACKGROUND)
 
; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
; examples: 
;   given: 20, expect 23
;   given: 78, expect 81
(define (tock ws)
  (+ ws 3))

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
   (big-bang ws
     [on-tick tock]
     [to-draw render]))




; WorldState -> WorldState 
; moves the car by  3 pixels for every clock tick 
; examples: 
;   given: 20, expect 23 
;   given: 78, expect 81 
;(define(tock ws) 
;  (+ ws 3))
