;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise89) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct VCat [x happiness])

(define vcat (make-VCat 20 100))

(define VIRTUAL-CAT-WORLD-WIDTH 200)

(define BACKGROUND (empty-scene VIRTUAL-CAT-WORLD-WIDTH 500))

;(define MAX-HAPPINESS-SCORE 100)

;(define happiness-score MAX-HAPPINESS-SCORE)

(define happiness-bar
  (overlay (rectangle 30 20 "outline" "black")
           (rectangle 30 20 "solid" "red")))


(define (gauge-prog w action)
  (cond
    [(string=? action "clock-tick")
     (if (< (- (VCat-happiness w) 1)
          0)
         (make-VCat (VCat-x w) 0)
         (make-VCat (VCat-x w) (- (VCat-happiness w) 1)))]
    [(string=? action "down")
     (make-VCat (VCat-x w)
           (+ (VCat-happiness w) (/ (VCat-happiness w) 5)))]
    [(string=? action "up")
     (make-VCat(VCat-x w)
           (+ (VCat-happiness w) (/ (VCat-happiness w) 3)))]))

        

(define (tock ws)
  (gauge-prog ws "clock-tick"))

  
(define (render vcat)
  (if (>= (VCat-happiness vcat) 100)
      (place-image happiness-bar
                   50
                   70
                   BACKGROUND)
      BACKGROUND))

(define (key-action w a-key)
  (cond
    [(key=? a-key "up")    (gauge-prog w "up")] 
    [(key=? a-key "down")  (gauge-prog w "down")]
    [else w]))


(define (main vcat)
  (big-bang vcat
    [on-tick tock]
    [to-draw render]
    [on-key key-action]))

