;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname picture-of-rocket.v5.4) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define WIDTH 200)
(define HEIGHT 400)
(define MTSCN (empty-scene WIDTH HEIGHT))

(define ROCKET (overlay (circle 10 "solid" "green")
         (rectangle 40 4 "solid" "green")))

(define ROCK-BED (rectangle 300 10 "solid" "red")) ; 10个像素的岩石平台，在最下面;矩形设置成与画布一样宽还是无法与画布等宽

(define ROCKET-CENTER-TO-TOP
  (- HEIGHT (/ (image-height ROCKET) 2) 10)) ; 10个像素的最下面的岩石平台

; fucntionns
(define (picture-of-rocket.v5.4 h)
  (cond
    [(<= h ROCKET-CENTER-TO-TOP)
     (place-image  ROCK-BED 0 (- HEIGHT 10)
      (place-image ROCKET 50 h MTSCN))]
    [(> h ROCKET-CENTER-TO-TOP)
     (place-image ROCKET 50 ROCKET-CENTER-TO-TOP MTSCN)]))