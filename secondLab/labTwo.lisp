//
(defun two(xs) (if (null xs) nil (let ( (x (car xs)) (xk (cdr xs)) ) (append (list x x) (two xk)))))
(defun twelve (x xs) (if (null xs) 0 (if (eq x (car xs)) (+ 1 (twelve x (cdr xs))) (twelve x (cdr xs)))))

(princ "2:")(princ (two '(1 2 3 4)))
(terpri)

(princ "12:")(princ (twelve 1 '(1 1 2 3 1 4 1 7 6 1 9)))
(terpri)

(bye)
