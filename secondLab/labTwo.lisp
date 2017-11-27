//
(defun two(xs) (if (null xs) nil (let ( (x (car xs)) (xk (cdr xs)) ) (append (list x x) (two xk)))))
(defun twelve (x xs) (if (null xs) 0 (if (eq x (car xs)) (+ 1 (twelve x (cdr xs))) (twelve x (cdr xs)))))
(defun twentytwo (xs k n) (if (null xs) 0
(if (eq k 1)
(if (eq n 1) (list (car xs)) (append (list (car xs)) (twentytwo (cdr xs) k (- n 1))) )
(twentytwo (cdr xs) (- k 1) n) )
) )

(princ "2:")(princ (two '(1 2 3 4)))
(terpri)

(princ "12:")(princ (twelve 1 '(1 1 2 3 1 4 1 7 6 1 9)))
(terpri)

(princ "12:")(princ (twentytwo '(1 2 3 4 5 6 7 8 9 10) 3 4))
(terpri)

(bye)
