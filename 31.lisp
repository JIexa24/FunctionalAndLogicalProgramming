
(defun tt(xs) (if (null xs) nil (if (eq (car xs) 0) (append (tt (cdr xs)) (list (car xs))) (append (list (car xs)) (tt (cdr xs)))) ) )

(princ "26:")(princ (tt '(1 1 0 0 4 0 2 3 0 2 1)))
(terpri)

(bye)
