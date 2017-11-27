//
(defun two(l1 l2) (cond ((and (null l1) (null l2)) t)
                        ((member (car l1) l2) (equal (remove (car l1) l1) (remove (car l1) l2)) t)
                        (t	nil)))

(princ "2:")(princ (two '(a b c) '(d c a b e)))
(terpri)
(princ "2:")(princ (two '(f g h) '(d c a b e)))
(terpri)

(bye)
