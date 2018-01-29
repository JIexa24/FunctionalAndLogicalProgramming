
(defun tt(xs x y) (if (null xs) nil (if (eq (car xs) x) (append (list y) (tt (cdr xs) x y)) (cons (car xs) (tt (cdr xs) x y)) ) ))

(princ "39:")(princ (tt '(1 2 1 4 2 1) 1 0))
(terpri)

(bye)
