;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Exercise84) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [pre post]) 
; An Editor is a structure: 
;    (make-editor String String) 
; interpretation (make-editor s t) describes an editor 
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t

(define editor2 (make-editor "hello " "world"))

(define (string-rest str)
  (if (string=? str "")
      ""
      (substring str
                 1
                 (string-length str))))


(define (string-first str)
  (if (string=? str "")
      ""
      (substring str 0 1)))

(define (string-last str)
  (if (string=? str "")
      ""
      (substring str (- (string-length str)
                        1)
                 (string-length str))))

(define (string-remove-last str)
  (if (string=? str "")
      ""
      (substring str
                 0
                 (- (string-length str)
                    1))))


(define (render editor1)
  (overlay/align "left" "center"
                 (beside      (text (editor-pre editor1) 16 "black")
                              (rectangle 1 20 "solid" "red")
                              (text (editor-post editor1) 16 "black"))           
                 (empty-scene 200 20)))

(define (edit ed ke)
  (if (> (string-length ke) 1)
      (cond
        [(key=? "left" ke)
         (make-editor (string-remove-last (editor-pre ed))
                      (string-append (string-last (editor-pre ed))
                                     (editor-post ed)))]
      
        [(key=? "right" ke)
         (make-editor
          (string-append (editor-pre ed)
                         (string-first (editor-post ed)))
          (string-rest (editor-post ed)))]
        [else ed])
      (cond
        [(key=? "\b" ke)
         (make-editor (string-remove-last (editor-pre ed))
                      (editor-post ed))]
        [(or (key=? "\t" ke)
             (key=? "\r" ke)) ed]
        [else
         (make-editor (string-append (editor-pre ed) ke)
                      (editor-post ed))])))

(define (main ed)
  (big-bang ed
    [to-draw render]
    [on-key edit]))