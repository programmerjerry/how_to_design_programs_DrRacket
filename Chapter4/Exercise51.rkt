;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Exercise51) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
; TrafficLight -> TrafficLight 
; yields the next state given current state s 
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "green") "yellow")
(check-expect (traffic-light-next "yellow") "red")

(define WIDTH-OF-WORLD 500)

(define BACKGROUND (empty-scene WIDTH-OF-WORLD 500))

(define current-light-color "red")

(define (graffic-light color)
  (circle 20 "solid" color))

(define (change-light-color)
  (set! current-light-color (traffic-light-next current-light-color)))

(define (traffic-light-next s) 
  (cond 
    [(string=? "red" s) "green"] 
    [(string=? "green" s) "yellow"] 
    [(string=? "yellow" s) "red"]))

(define (render ws)
  (place-image (graffic-light current-light-color)
               100
               100
               BACKGROUND))

(define cnt 0)

(define (tock ws)
  (if (= (modulo cnt 10) 0)
      (begin
        (change-light-color)
        (set! cnt (+ cnt 1)))
      (set! cnt (+ cnt 1))))

(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]))