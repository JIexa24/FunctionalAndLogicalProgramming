//
(defun task(lst)
  (cond ((null lst) nil)
        ((member (car lst) (cdr lst)) (cons (car lst) (task (remove (car lst) (cdr lst)))))
        (t (task (cdr lst)))))

(defun lengt (lst) (if (null lst) 0 (+ 1 (lengt (cdr lst)))))

(defun run (tt) (lengt (task tt)) )

(princ "49:")(princ (run '(5 1 2 1 3 5 5 7)))
(terpri)

(bye)
