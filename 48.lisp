
(defun tt(xs) (if (null xs) -1 (if (eq (car xs) (car (cdr xs))) (tt (cdr xs)) (+ 1 (tt (cdr xs)))) ) ))

(princ "48:")(princ (tt '(1 1 3 3 3 3 4 3 4 4 )))
(terpri)

(bye)
