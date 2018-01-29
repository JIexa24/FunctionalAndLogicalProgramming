
(defun tt (w)
  (cond ((null (cddr w)) 0)
        ((and (= (car w) (cadr w))
              (= (cadr w) (caddr w)))
         (+ 1 (tt (cdr w))))
        ((tt (cdr w)))))

(princ "36:")(princ (tt '(1 1 3 3 3 3 4 3 4 4 4 2 1 1 1)))
(terpri)

(bye)
