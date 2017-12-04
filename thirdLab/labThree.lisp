//
(defun two(l1 l2) (cond ((and (null l1) (null l2)) nil)
                        ((member (car l1) l2) (equal (remove (car l1) l1) (remove (car l1) l2)) t)
                        (t	nil)))

(defun five(a b) (cond ((null a) b)
(t (cons (car a) (five (remove (car a) (cdr a)) (remove (car a) b))))))

(defun ten(function list) (cond ((null list) nil)
                             ((null (funcall function (car list))) (cons '* (ten function (cdr list))))
                             (t (cons (car list) (ten function (cdr list)))) ))

(princ "2:")(princ (two '(a b c) '(d c a b e)))
(terpri)
(princ "2:")(princ (two '(f g h) '(d c a b e)))
(terpri)

(princ "5:")(princ (five '(a b c d e) '(f g c b a k)))
(terpri)
(princ "5:")(princ (five '(a b c) '()))
(terpri)

(princ "10:")(princ (ten #'numberp '(1 a 2 b 3 c 4 d 5 e)))
(terpri)

(princ "10:")(princ (ten #'(lambda (x) (< x 0)) '(1 -1 -2 2 3 -3 -4 4 5 -5)))
(terpri)
(bye)
