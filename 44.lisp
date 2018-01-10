//
(defun tt (x xs)
  (cond ((null xs) nil)
        ((and (eq (cadr xs) x) (not (eq (car xs) (cadr xs)))) (tt x (cdr xs)))
        ((cons (car xs) (tt x (cdr xs))))))

(princ "44:")(princ (tt 1 '(1 2 1 1 3)))
(terpri)

(bye)
