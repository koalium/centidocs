; Negar.Lsp        A Lisp Program For Editing Persian Text.
;
;                                    1373/7/27   Ver. 1
;                                     H.Baghi
;

(defun c:ed() (command "edit" "negar.lsp"))
(defun c:lo() (load "negar.lsp"))
;-------------------------------------- Initial Value
(defun c:negar()  
  (setq scmde (getvar "cmdecho"))
  (setvar "cmdecho" 0)
  (setvar "blipmode" 0)
  (setq etname "")
  (setq sleep 0)
  (while (/= etname "TEXT")
    (setq e (entsel "\nSelect a persian text:"))
    (if (= e nil) (setq etname "null")
      (progn
       (setq spoint (cadr e))                        ;Selection Point Coor.
       (setq ename (car e))                          ;Entity Name
       (setq elist (entget ename))                   ;Entity List
       (setq etname (cdr (assoc 0 elist)))           ;Entity Type Name
      )
    )
    (if (/= etname "text") (princ (strcat "\nEntity is: " (strcat etname))))
    (setq sleep (1+ sleep))
    (if (= sleep 4) 
      (progn 
        (prompt "\nWhat Do You Do?  Are You SLEEPY ?")
        (setq sleep 1)
      )
    )
  )
  (setq texti (cdr (assoc 1 elist)))                 ;Initial Text List
  (setq th (cdr (assoc 40 elist)))                   ;Text Height
  (setq tr (cdr (assoc 50 elist)))                   ;Rotation Angle
  (setq ti (cdr (assoc 10 elist)))                   ;Insertion Point        
  (setq lengthi (strlen texti))                      ;Initial Text List Length
  (setq numm 0)
  (setq num 1)
  (setq pt '(0 0 0))
  (setq trd (/ (* 180.0 tr) pi))
  (setq thh (* th 1.5))   
  (while (<= num lengthi)
    (setq text00 (substr texti num 1))    
    (if (or (= 32 (ascii text00)) (= num lengthi)) 
      (progn
        (setq e11 (substr texti 1 num))
        (setq txtlist (assoc 1 elist))
        (setq elist (subst (cons 1 e11) txtlist elist))
        (entmod elist)
        ;--------------------------------------- Temporary Text
        (setq pt (list (+ (car ti) (car pt)) (- (+ (cadr ti) (cadr pt)) thh) (caddr ti)))
        (setq textv0 (cdr (assoc 1 (entget(entlast)))))
        (princ "\nNew Text: ")
        (command "dtext" pt th trd)
        (setq textv (cdr (assoc 1 (entget(entlast)))))
        (if (= textv0 textv) 
          (setq textv "")
          (command "erase" "l" "")
        )
        ;--------------------------------------- Text List Change
        (if (or (/= textv "") (= (ascii textv) 32))
          (progn
            (if (/= (ascii textv) 32)
              (setq textv (taviz textv))             ;Text List Change
            )            
            (setq lengthv (strlen textv))            ;Text Length Change
            (if (> numm 0) 
              (progn
                (setq text0 (substr texti 1 numm))
              )
              (setq text0 "")
            )
            (if (/= num lengthi) 
              (progn
                (setq text1 (substr texti num))
              )
              (setq text1 "")
            )
            (setq texti (strcat text0 textv text1))
            (setq lengthi (strlen texti))    
            (setq numm (+ numm lengthv 1))
            (setq num numm)
          )
          (setq numm num)
        )
        ;--------------------------------------- Temporary Text Insertion Point
        (setq pt (car (textbox elist)))                  
      )
    )
    (setq num (1+ num))
  )
  (setq txtlist (assoc 1 elist))
  (setq elist (subst (cons 1 texti) txtlist elist))
  (entmod elist)
  (setq elist nil)
  (setvar "cmdecho" scmde)
  (setvar "blipmode" 1)
)
;--------------------------------- KATEB --------------------------------------
(setq charm1 (list 104 151 152 153 78 110 169 170 171 66 98 133 134
                  135 67 99 136 137 138 70 92 124 211 212 213 44 226
                  227 228 60 229 230 231 62 232 233 234 235 236 237
                  32 71 72 86 118 193 194 195 167 168))
(setq charm2 (list 32 33 35 36 37 38 40 41 42 43 45 46 47 48
                  49 50 51 52 53 54 55 56 57 61 63 64 94 127 128 129))
(setq charm (append charm1 charm2))
(setq charn (append charm2 (list 32 70 71 72)))
(setq charo (list (list 96 126) (list 58 127) (list 59 127) (list 34 128)
                 (list 39 128) (list 44 129) (list 60 131) (list 62 132)
           )
)
(setq charp (list 96 58 59 34 39 44 60 62))
(setq charq (list 104 110 98 99 118 124 129 130 131))
;--------------------------------------
(defun taviz (so)
  (setq l (strlen so))
  (setq n 1)
  (setq nwo "")
  (while (<= n l)
   (if (= n 1)
    (setq ee " ")
    (setq ee (substr so (1- n) 1))
   )
   (setq f (substr so n 1))
   (if (= n l)
    (setq g " ")
    (setq g (substr so (1+ n) 1))
   )
   (setq asce (ascii ee))
   (setq ascff (setq ascf (ascii f)))
   (setq ascg (ascii g))
   (if (= (member ascf charm2) nil)
    (if (= (member ascf (list 32 95 70 71 72)) nil)
     (progn
      (if (/= (and (> ascf 64) (< ascf 94)) nil)
        (setq ascff (setq ascf (+ ascf 32)))
      )
      (if (/= (member ascf charp) nil)
        (setq ascf (car (cdr (assoc ascf charo))))
      )
      (if (/= (member asce charm) nil)
       (if (/= (member ascg charn) nil)
        (if (= (member ascf charq) nil)
         (setq ascf (+ (* (- ascf 97) 3) 132))
         (setq ascf ascff)
        )
        (setq ascf ascff)
       )
       (if (/= (member ascg charn) nil)
        (if (= (member ascf charq) nil)
         (setq ascf (+ (* (- ascf 97) 3) 131))
         (setq ascf (+ (* (- ascf 97) 3) 130))
        )
        (setq ascf (+ (* (- ascf 97) 3) 130))
       )
      )
     )
    )
   )
   (setq n (1+ n))
   (setq nwo (strcat nwo (chr ascf)))
  )
  (setq so nwo)
)
;----------------------------------- END --------------------------------------
(princ "\nNEGAR.LSP Loaded , Type NEGAR For Use.")
(princ)
