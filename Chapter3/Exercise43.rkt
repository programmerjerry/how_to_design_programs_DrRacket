;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise43) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define WIDTH-OF-WORLD 500)

(define WHEEL-RADIUS 5)

(define Y-CAR 20)

(define (y-coordinate x)
  (+ (*
      (sin x)
      20)
     Y-CAR))

(define (x-coordinate x)
  (- x
     (/ CAR-BODY-WIDTH
        2)))

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


(define BACKGROUND (empty-scene WIDTH-OF-WORLD 500))


(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

; WorldState -> Image
; places the image of the car x pixels from 
; the left margin of the BACKGROUND image 
;(define (render x)
;  BACKGROUND)

; WorldState -> Image
; places the car into the BACKGROUND scene,
; according to the given world state 
(define (render ws)
  (if (> (x-coordinate ws)
         (- WIDTH-OF-WORLD
            (/ (length-car CAR)
               2)))
      (place-image tree
                   100
                   (y-coordinate (x-coordinate ws))
                   BACKGROUND)
      (place-image CAR
                   (x-coordinate ws)
                   (y-coordinate (x-coordinate ws))
                   BACKGROUND)))

;(define (render-tree ws)
;  (place-image tree ws Y-CAR BACKGROUND))
 
; WorldState -> WorldState 
; moves the car by 3 pixels for every clock tick
; examples: 
;   given: 20, expect 23
;   given: 78, expect 81
(define (tock ws)
  (+ ws
     3))

(define (length-car car)
  (image-width car))

(define (stop? ws)
  (> (x-coordinate ws)
     (+ WIDTH-OF-WORLD
        (/ (length-car CAR)
           2))))

; WorldState -> WorldState
; launches the program from some initial state 
(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [stop-when stop?]))

(check-expect (tock 20) 23)
(check-expect (tock 78) 81)