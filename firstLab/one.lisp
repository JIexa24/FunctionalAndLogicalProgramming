//
(defun one(x) (cadr (car (cdr (car (car x))))))
(defun two(x) (cadr (cdaadr x)))
(defun three(x) (car (caadar x)))
(defun four(x) (car (cadadr x)))
(defun five(x) (car (cddadr x)))
(defun six(x) (cadr (cadadr x)))
(defun seven(x) (car (cdaadr x)))
(defun eight(x) (car (caddar (cdddar x))))
(defun nine(x) (car (cddar (cdadar x))))
(defun ten(x) (car (cdar (cdadar x))))

(princ "1:")(princ (one '(((1 (2 *)) 3) 4))) 
(terpri)
(princ "2:")(princ (two '(1 (((2 3) (4 5) *) (6)))))
(terpri)
(princ "3:")(princ (three '((1 ((*) 2 3)))))
(terpri)
(princ "4:")(princ (four '(1 (2 (* 3) 4) 5)))
(terpri)
(princ "5:")(princ (five '(1 (2 (3 4) *))))
(terpri)
(princ "6:")(princ (six '((1 2) (3 (4 *) 5))))
(terpri)
(princ "7:")(princ (seven '((1) ((2 *)) (3 (4)))))
(terpri)
(princ "8:")(princ (eight '((1 2 3 (4 5 (*))))))
(terpri)
(princ "9:")(princ (nine '((1 (2 (3 4 *))))))
(terpri)
(princ "10:")(princ (ten '((1 (2 (3 *))))))
(terpri)

(bye)
