;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise53) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define HEIGHT 300) ; distances in pixels 
(define WIDTH 100) 
(define YDELTA 3) 
(define BACKG (empty-scene WIDTH HEIGHT)) 
(define ROCKET (rectangle 5 30 "solid" "red"))
(define CENTER (/ (image-height ROCKET) 2))

; LRCD -> Image 
; renders the state as a resting or flying rocket 
;(define (show x) 
;  BACKG)
(define (show x) 
  (cond 
    [(string? x) (place-image ROCKET 10 (- HEIGHT CENTER) BACKG)]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (place-image ROCKET 10 (- HEIGHT CENTER) BACKG))] 
    [(>= x 0)
     (place-image ROCKET 10 (- x CENTER) BACKG)]))


; LRCD KeyEvent -> LRCD 
; starts the countdown when space bar is pressed, 
; if the rocket is still resting 
(define (launch x ke)
  (cond 
    [(string? x) (if (string=? " " ke) -3 x)] ))
; [(<= -3 x -1) x] 
; [(>= x 0) x]))


; LRCD -> LRCD 
; raises the rocket by YDELTA, 
; if it is moving already 
(define (fly x)
  (cond [(string? x) x]
        [(<= -3 x -1) (if (= x -1) HEIGHT (+ x 1))]
        [(>= x 0) (- x YDELTA)]))

(define (main x)
  (big-bang x
    [on-key launch]
    [on-draw show]
    [on-tick fly]))

(check-expect
 (show "resting")
 (place-image ROCKET 10 (- HEIGHT CENTER) BACKG))

(check-expect
 (show -2)
 (place-image (text "-2" 20 "red")
              10 (* 3/4 WIDTH)
              (place-image ROCKET 10 (- HEIGHT CENTER) BACKG)))

(check-expect 
 (show HEIGHT) 
 (place-image ROCKET 10 (- HEIGHT CENTER) BACKG)) 

(check-expect 
 (show 53) 
 (place-image ROCKET 10 (- 53 CENTER) BACKG))

