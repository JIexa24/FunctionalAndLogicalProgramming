
(defun tt(xs x y) (if (null xs) nil (if (eq (car xs) y) (append (list x (car xs)) (tt (cdr xs) x y)) (cons (car xs) (tt (cdr xs) x y)) ) ))

(princ "39:")(princ (tt '(1 2 1 5 8 1 0) 5 1))
(terpri)

(bye)
