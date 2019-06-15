;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Exercise47) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define VIRTUAL-CAT-WORLD-WIDTH 200)

(define BACKGROUND (empty-scene VIRTUAL-CAT-WORLD-WIDTH 500))

(define MAX-HAPPINESS-SCORE 100)

(define happiness-score MAX-HAPPINESS-SCORE)

(define happiness-bar
  (overlay (rectangle 30 20 "outline" "black")
           (rectangle 30 20 "solid" "red")))


(define (gauge-prog action)
  (cond
    [(string=? action "clock-tick")
     (if (<
          (- happiness-score 0.1)
          0)
         0
         (set! happiness-score (- happiness-score 0.1)))]
    [(string=? action "down")
     (set! happiness-score
           (+ happiness-score (/ happiness-score 5)))]
    [(string=? action "up")
     (set! happiness-score
           (+ happiness-score (/ happiness-score 3)))]))

        

(define (tock ws)
  (gauge-prog "clock-tick"))

  
(define (render ws)
  (if (>= happiness-score 100)
      (place-image happiness-bar
                   50
                   70
                   BACKGROUND)
      BACKGROUND))

(define (key-action w a-key)
  (cond
    [(key=? a-key "up")    (gauge-prog "up")] 
    [(key=? a-key "down")  (gauge-prog "down")]
    [else w]))


(define (main ws)
  (big-bang ws
    [on-tick tock]
    [to-draw render]
    [on-key key-action]))

