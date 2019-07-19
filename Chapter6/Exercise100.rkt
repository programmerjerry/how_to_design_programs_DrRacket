;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise100) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
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
;(define-struck missile [posn])

; A SIGS is one of: 
; – (make-aim UFO Tank)
; – (make-fired UFO Tank Missile)
; interpretation represents the complete state of a 
; space invader game


(define WORLD-WIDTH 200)
(define WORLD-HEIGHT 500)

(define TANK-HEIGHT 5)

(define BACKGROUND (empty-scene WORLD-WIDTH 500))


; SIGS -> Image
; renders the given game state on top of BACKGROUND 
; for examples see figure 32
;(define (si-render s)
;  (cond
 ;   [(aim? s)
 ;    (tank-render (aim-tank s)
 ;                 (ufo-render (aim-ufo s) BACKGROUND))]
 ;   [(fired? s)
 ;    (tank-render
 ;     (fired-tank s)
 ;     (ufo-render (fired-ufo s)
  ;                (missile-render (fired-missile s)
   ;                               BACKGROUND)))]))


(define TANK
  (rectangle 20 5 "solid" "blue"))

; Tank Image -> Image 
; adds t to the given image im

(define (tank-render t im)
  (place-image im
               (tank-loc (fired-tank t)) 5
               BACKGROUND))
 

;(tank-render
; (fired-tank s)
; (ufo-render (fired-ufo s)
;             (missile-render (fired-missile s)
 ;                            BACKGROUND)))


(define UFO
  (overlay (circle 10 "solid" "green")
           (rectangle 40 5 "solid" "black")))
  
 
; UFO Image -> Image 
; adds u to the given image im

(define (ufo-render u im)
  (place-image im
               (posn-x (fired-ufo u)) (posn-y (fired-ufo u))
               BACKGROUND))


;(ufo-render
; (fired-ufo s)
; (tank-render (fired-tank s)
;              (missile-render (fired-missile s)
;                             BACKGROUND)))

(define MISSILE
  (triangle 40 "solid" "red"))

; Missile Image -> Image 
; adds m to the given image im
(define (missile-render m im)
  (place-image im
               (posn-x (fired-missile m)) (posn-y (fired-missile m))
               BACKGROUND))


; 导弹未发射或者导弹未射中UFO的时候，两个表达式是一样的结果




; The game stops if the UFO lands or if the missile hits the UFO
(define (si-game-over?  s)
  (or (posn-y (fired-ufo s))
      (<= (abs (sqrt (+ (sqr (- (posn-x (fired-missile s))
                                (posn-x (fired-ufo s))))
                        (sqr (- (posn-y (fired-missile s))
                                (posn-y (fired-ufo s))))))))
      1))


  
; si-render-final


;(define (si-move s))


; Number -> Number
; produces a number in the interval [0,n),
; possibly a different one each time it is called 
;(define (random n) ...)


;(define (si-move w)
;  (si-move-proper w (random ...)))

(define (si-move w)
  (make-fired (fired-tank w) ; 坦克不需要自动移动
              (missile-move w)
              (ufo-move w)))
 
; SIGS Number -> SIGS 
; moves the space-invader objects predictably by delta
(define (si-move-proper w delta)
  w)



(define (tank-move w direction)
  (if (string=? "left" direction)
      (make-tank (- (tank-loc (fired-tank w))
                    (tank-vel (fired-tank w)))
                 (tank-vel (fired-tank w)))
      (make-tank (+ (tank-loc (fired-tank w))
                    (tank-vel (fired-tank w)))
                 (tank-vel (fired-tank w)))))
  

  

(define (missile-move w)
  (make-posn (posn-x (fired-missile w))
             (+ (posn-y (fired-missile w))
                (tank-vel (fired-tank w)))))


(define (ufo-move w)
  (make-posn (posn-x (fired-ufo w))
             (+ (posn-y (fired-ufo w))
                3)))


;pressing the left arrow ensures that the tank moves left;

;pressing the right arrow ensures that the tank moves right; and

;pressing the space bar fires the missile if it hasn’t been launched yet.
(define (si-control w ke)
  (cond
    [(key=? "left" ke) (tank-move w "left")]
    [(key=? "right" ke) (tank-move w "right")]))
   ; [(key=? "space" ke) ])) ; 按空格发射导弹


;(define (si-main w)
;  (big-bang w
;    [on-draw si-render]
;    [on-key si-control]
;    [on-tick si-move]))


; SIGS.v2 -> Image 
; renders the given game state on top of BACKGROUND 
(define (si-render.v2 s)
  (tank-render
    (sigs-tank s)
    (ufo-render (sigs-ufo s)
                (missile-render.v2 (sigs-missile s)
                                   BACKGROUND))))


(define-struct sigs [ufo tank missile])
; A SIGS.v2 (short for SIGS version 2) is a structure:
;   (make-sigs UFO Tank MissileOrNot)
; interpretation represents the complete state of a
; space invader game
 
; A MissileOrNot is one of: 
; – #false
; – Posn
; interpretation#false means the missile is in the tank;
; Posn says the missile is at that location



; MissileOrNot Image -> Image 
; adds an image of missile m to scene s 
(define (missile-render.v2 m s)
  s)



