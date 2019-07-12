;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise56) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define HEIGHT 300) ; distances in pixels 
(define WIDTH 100) 
(define YDELTA 3) 
(define BACKG (empty-scene WIDTH HEIGHT)) 
(define ROCKET (rectangle 5 30 "solid" "red"))
(define CENTER (/ (image-height ROCKET) 2))

(define (draw-rocket x y)
  (place-image ROCKET x y BACKG))


; LRCD -> Image 
; renders the state as a resting or flying rocket 
;(define (show x) 
;  BACKG)
(define (show x) 
  (cond 
    [(string? x) (draw-rocket 10 (- HEIGHT CENTER))]
    [(<= -3 x -1)
     (place-image (text (number->string x) 20 "red")
                  10 (* 3/4 WIDTH)
                  (draw-rocket 10 (- HEIGHT CENTER)))] 
    [(>= x 0)
     (draw-rocket 10 (- x CENTER))]))



; LRCD KeyEvent -> LRCD 
; starts the countdown when space bar is pressed, 
; if the rocket is still resting 
(define (launch x ke)
  (cond 
    [(string? x) (if (string=? " " ke) -3 x)]
    [(<= -3 x -1) x] 
    [(>= x 0) x]))


(check-expect (fly "resting") "resting")
(check-expect (fly -3) -2)
(check-expect (fly -2) -1)
(check-expect (fly -1) HEIGHT)
(check-expect (fly 10) (- 10 YDELTA))
(check-expect (fly 22) (- 22 YDELTA))


; LRCD -> LRCD 
; raises the rocket by YDELTA, 
; if it is moving already 
(define (fly x)
  (cond [(string? x) x]
        [(<= -3 x -1) (if (= x -1) HEIGHT (+ x 1))]
        [(> x 0) (- x YDELTA)]))

(define (stop-fn? x)
  (and (not (string? x))
       (= x 0)))

(define (main x)
  (big-bang x
    [on-key launch]
    [on-draw show]
    [on-tick fly 0.05]
    [stop-when stop-fn?]))

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


(check-expect (launch "resting" " ") -3) 
(check-expect (launch "resting" "a") "resting") 
(check-expect (launch -3 " ") -3) 
(check-expect (launch -1 " ") -1) 
(check-expect (launch 33 " ") 33) 
(check-expect (launch 33 "a") 33)

