;;; UK Salary Take Home Calculator
;;; @author Gordon Dent (GordyD)
(defpackage :takehome
  (:use :common-lisp)
)

(in-package :takehome)

; Work out the tax bracket the salary falls into
(defun tax-bracket (x) 
  (if (< x 10001)
    "0% tax"
    (if (< x 41866)
      "20% tax"
      (if (< x 160000)
        "40% tax"
        (if (> x 160000)
          "45% tax"
        )
      )
    )
  )
)

; Calculate the amount of tax owed given a yearly salary
;  - Under 10,000 pays no tax
;  - Between 10,000 - 41,866 pays 20%
;  - Between 41,866 - 160,000 pays 40%
;  - Over 160,000 pays 45%
(defun tax (x) 
  (if (< x 10001)
    0
    (if (< x 41866)
      (* (/ (- x 10000) 100) 20)
      (if (< x 160000)
        (+ (* (/ 31866 100) 20) (* (/ (- x 41866) 100) 40))
        (+ (* (/ 31866 100) 20) (* (/ (- x 41866) 100) 40) (* (/ (- x 160000) 100) 45))
      )
    )
  )
)

; Calculate the amount of NI contributions owed given a yearly salary
;  - Under 7,956 pays no NI contributions
;  - Between 7,956 - 41,860 pays 12%
;  - Over 41,860 pays 2%
(defun ni (x)
  (if (< x 7956)
    0
    (if (< x 41860)
      (* (/ (- x 7956) 100) 12)
      (+ (* (/ 33904 100) 12) (* (/ (- x 41860) 100) 2))
    )
  )
)

; Print out a breakdown of the Salary
(defun salary (x) 
  (let 
      ((net (coerce x 'float)))
      (let 
        (
          (dt (tax net))
          (dn (ni net))
        )
        (format nil " Salary Breakdown ~% ---------- ~% Net: ~:D ~% Tax Paid: ~:D ~% NI Paid: ~:D ~% Gross: ~:D ~%" 
                net dt dn (- net dt dn)
        )
      )
  )
)