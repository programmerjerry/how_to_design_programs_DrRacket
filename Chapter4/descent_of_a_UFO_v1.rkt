;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname descent_of_a_UFO_v1) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define WIDTH 300)
(define HEIGHT 500)
(define CLOSE (/ HEIGHT 3))
(define MTSCN
  (empty-scene WIDTH HEIGHT))

(define UFO
  (overlay (circle 10 "solid" "green")
           (rectangle 40 5 "solid" "black")))

(define (status-line color)
  (rectangle WIDTH 5 "solid" color))


               

(define (main y0)
  (big-bang y0
    [on-tick nxt]
    [to-draw render/status]))

(check-expect (nxt 11) 14)
(define (nxt y)
  (+ y 3))

(check-expect (render 11) (place-image UFO 30 11 MTSCN))

(check-expect (render/status 10)
              (place-image (text "descending" 11 "green")
                           10 10
                           (render 10)))



(define (render y)
    (place-image UFO 30 y MTSCN))

(define (render/status y)
  (cond
    [(<= 0 y CLOSE)
      (place-image (text "descending" 11 "green")
                   10
                   10
                   (render y))]
    [(and (< CLOSE y) (<= y HEIGHT))
      (place-image (text "closing in" 11 "orange")
                   10
                   10
                   (render y))]
    [(> y HEIGHT)
     (place-image (text "landed" 11 "red")
                  10 10
                  (render y))]))