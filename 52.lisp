
(defun tt(xs) (if (null xs) nil (if (> (car xs) 0) (append (tt (cdr xs)) (list (car xs))) (append (list (car xs)) (tt (cdr xs)))) ) )

(princ "26:")(princ (tt '(-1 2 1 -4 6 -2 3)))
(terpri)

(bye)
