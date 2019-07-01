;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise97) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct aim [ufo tank])
(define-struct fired [ufo tank missile])

; 引用的库已经定义posn这个结构了
;(define-struct posn [x y])

; A UFO is a Posn. 
; interpretation (make-posn x y) is the UFO's location 
; (using the top-down, left-to-right convention)
 
(define-struct tank [loc vel])
; A Tank is a structure:
;   (make-tank Number Number). 
; interpretation (make-tank x dx) specifies the position:
; (x, HEIGHT) and the tank's speed: dx pixels/tick 
 
; A Missile is a Posn. 
; interpretation (make-posn x y) is the missile's place

; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the complete state of a 
; space invader game


(define WORLD-WIDTH 200)
(define WORLD-HEIGHT 500)

(define BACKGROUND (empty-scene WORLD-WIDTH 500))


; SIGS -> Image
; renders the given game state on top of BACKGROUND 
; for examples see figure 32
(define (si-render s)
  (cond
    [(aim? s)
     (tank-render (aim-tank s)
                  (ufo-render (aim-ufo s) BACKGROUND))]
    [(fired? s)
     (tank-render
       (fired-tank s)
       (ufo-render (fired-ufo s)
                   (missile-render (fired-missile s)
                                   BACKGROUND)))]))


(define TANK
   (rectangle 20 5 "solid" "blue"))

; Tank Image -> Image 
; adds t to the given image im

(define (tank-render t im)
  (place-image im
               (tank-loc (fired-tank s)) 5
               BACKGROUND))
 

(tank-render
  (fired-tank s)
  (ufo-render (fired-ufo s)
              (missile-render (fired-missile s)
                              BACKGROUND)))


(define UFO
  (overlay (circle 10 "solid" "green")
           (rectangle 40 5 "solid" "black")))
  
 
; UFO Image -> Image 
; adds u to the given image im

(define (ufo-render u im)
  (place-image im
               (ufo-x (fired-ufo s)) (ufo-y (fired-ufo s))
               BACKGROUND))


(ufo-render
  (fired-ufo s)
  (tank-render (fired-tank s)
               (missile-render (fired-missile s)
                               BACKGROUND)))

(define MISSILE
  (triangle 40 "solid" "red"))

; Missile Image -> Image 
; adds m to the given image im
(define (missile-render m im) im)


; 导弹未发射或者导弹未射中UFO的时候，两个表达式是一样的结果



