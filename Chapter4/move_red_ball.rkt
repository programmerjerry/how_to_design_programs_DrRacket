;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname move_red_ball) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define red-ball
  (circle 20 "solid" "red"))

(check-expect (keh 13 "left") 8)
(check-expect (keh 13 "right") 18)
(check-expect (keh 13 "a") 13)


(define WIDTH-OF-WORLD 500)

(define BACKGROUND (empty-scene WIDTH-OF-WORLD 500))

;(define p 50)

(define (render ws)
  (place-image red-ball
               ws
               100
               BACKGROUND))


(define (keh p k)
  (cond
    [(= (string-length k) 1)
     p]
    [(string=? "left" k)
     (- p 5)]
    [(string=? "right" k)
     (+ p 5)]
    [else p]))


(define (main ws)
  (big-bang ws
    [to-draw render]
    [on-key keh]))