
 (defun MOGI  ()
;      (setq   t1    1.6)
;      (setq   t2    1 )
;      (setq   t3    1 )
  (setq x1 50 )
   (setq y1 0.0 )
   (setq y13   0.0  )
   (setq y3   0.0  )
   (setq y2   0.0 )
   (setq y10   0.0  )
   (setq y9   0.0 )
   (setq y15 0.0 )
  (setq m1  1.5 )
  (setq m3  2.0 )

    (setq z2 (getreal  " \n\t Enter length of z2 \t"))
  (setq z1 (getreal  " \n\t Enter length of z1 \t"))
; (setq z1 2.4 )
; (setq m1 (getreal  " \n\t Enter m1 \t"))
; (setq m2 (getreal  " \n\t Enter m2           \t"))
  (setq m2  m1 )
; (setq m3 (getreal  " \n\t Enter m3           \t"))


; (setq m4 (getreal  " \n\t Enter m4           \t"))
  (setq m4 m3)
; (setq tt1 (getreal  " \n\t Enter  t1 \t"))
; (setq tt2 (getreal  " \n\t Enter t2 \t"))
  (setq bb  (getreal  " \n\t Enter  bb \t"))
; (setq t1 (+ tt1 (* m1 (- z2 z1))))
; (setq t2 (+ tt2 (* m2 (- z2 z1))))

  (setq mm1 (/ 1.0 m3 ))
   (setq mm2 (/ 1.0 m4 ))
    (setq l1 2.0)
    (setq h3 0.5)
    (setq b 6.0)




   (setq  p1  (list x1  y1  ))
   (setq  x12 (- x1 (/ b 2)))
   (setq  y12 z1)
   (setq  p12 (list x12  y12  ))
   (setq  x11 (+ x1 (/ b 2)))
   (setq  y11 z1)
   (setq  p11 (list x11  y11  ))
   (setq  x13 (- x12 (* mm1 z1)))
   (setq  p13 (list x13  y13  ))
   (setq  x10 (+ x11 (* mm2 z1)))
   (setq  p10 (list x10  y10  ))
   (setq  x16  x1)
   (setq  y16  z2)
   (setq  p16 (list x16  y16  ))
   (setq  x21 (- x16 1.0))
   (setq   y21  y16 )
   (setq  p21 (list x21  y21  ))
;  (setq  p17 ( polar  p12 (dtor 90) t1))
;  (setq  x17 (car p17))
;  (setq  y17 (cadr p17))
;  (print "p17")
;  (print p17)
;  (setq  x18 (- x17 m1  ) )
;  (setq  y18 (- y17 1.0))
;  (setq  p18 (list x18  y18  ))
;  (setq  p6 (inters p18 p17  p16 p21  nil  ))
;  (setq  x6  (car p6 ))
;  (setq  y6  (cadr p6 ))

   (setq  x6 (- x1 (/ bb 2)))
   (setq  y6 z2)
   (setq  p6 (list x6   y6   ))

   (setq  x7 (+ x1 (/ bb 2)))
   (setq  y7 y6)
   (setq  p7 (list x7   y7   ))



;  (setq  p3 (inters p17 p18 p1 p13  nil ))
;  (setq  x3  (car p3 ))
;  (setq  y3  (cadr p3 ))
   (setq  x3  (- x6 (* m1 (- z2  y3))))
   (setq  p3 (list x3   y3   ))

   (setq  x4  (+ x3 (* m1 h3 )))
   (setq  y4  (+ y3 h3 ))
   (setq  p4  (list x4   y4   ))
   (setq  x5 (- x4 l1))
   (setq  y5  y4)
   (setq  p5  (list x5   y5   ))
   (setq  x2  (- x5 (*  1.0 (- y5 y2))))
   (setq  p2  (list x2   y2   ))


 ; (setq  p19 ( polar  p11 (dtor 90) t2))
 ; (setq  x19 (car p19))
 ; (setq  y19 (cadr p19))
;  (setq  x20 (+ x19 (* m2 1.0)))
;  (setq  y20 (- y19 1.0))
;  (setq  p20 (list x20  y20  ))
;  (setq  p7 (inters p19 p20  p16 p21  nil  ))
;  (setq  x7  (car p7 ))
;  (setq  y7  (cadr p7 ))
;  (setq  p9 (inters p19 p20 p1 p13  nil ))
;  (setq  x9  (car p9 ))
;  (setq  y9  (cadr p9 ))
   (setq  x9  (+ x7 (* m2 (- z2  y9))))
   (setq  p9 (list x9   y9   ))




   (setq  x8  (- x9 (* m2 h3 )))
   (setq  y8  (+ y9 h3 ))
   (setq  p8  (list x8   y8   ))
   (setq  x14 (+ x8 l1))
   (setq  y14  y4)
   (setq  p14 (list x14  y14  ))
   (setq  x15 (+ x14 (*  1.0 (- y14 y15 ))))
   (setq  p15 (list x15  y15  ))



  (setq xone 5)
  (setq yone 5)
  (setq one (list xone yone))

  (command   "ucs" "o" one   "line" p2  p5 p4 p3       "c")

; (command  "line" p2  p5 p4 p3       "c")
  (command  "line" p9 p8 p14 p15  "c")
  (command  "line" p3 p6  p7 p9  "c" )
  (command  "line" p13  p12  p11  p10    "c"   )
; (command  "dim" "horizontal"  p1  p2  "text"  3.0 " " )
  (command  "redraw"  "" )



)

(defun dtor (d)
( * (/  pi 180 ) d) )























