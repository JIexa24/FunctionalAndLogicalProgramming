
(defun tt (w)
  (cond ((null (cddr w)) 0)
        ((and (/= (car w) (cadr w))
              (/= (car w) (caddr w))
              (/= (cadr w) (caddr w)))
         (+ 1 (tt (cdr w))))
        ((tt (cdr w)))))

(princ "36:")(princ (tt '(1 1 3 5 4 5 2 3 2 2 1 1 1)))
(terpri)

(bye)
