
(defun tt(xs) (if (null xs) nil (if (< (car xs) 0) (append (tt (cdr xs)) (list (car xs))) (append (list (car xs)) (tt (cdr xs)))) ) )

(princ "26:")(princ (tt '(1 -2 3 -4 -7 4 5)))
(terpri)

(bye)
