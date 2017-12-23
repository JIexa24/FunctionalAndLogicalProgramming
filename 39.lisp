
(defun tt(xs x) (if (null xs) nil (if (eq (car xs) x) (tt (cdr xs) x) (cons (car xs) (tt (cdr xs) x)) ) ))

(princ "39:")(princ (tt '(1 2 1 3 1 1 2 5 6) 1))
(terpri)

(bye)
