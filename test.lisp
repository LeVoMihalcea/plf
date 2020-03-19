; Se da o lista neliniara formata din numere si atomi. Sa se determine lista elementelor numerice divizibile cu 3 din lista initiala, de la orice nivel, in ordine inversa si o singura data.
; L= (3 a (b 9 ( 9 c (6 (d 15) b 20)) 7)) => R = (15 6 9 3)


; flatten(l : list) = {
; 	nil, if l == nil,
; 	l1 U flatten(l2..ln), if l1 is atom
; 	flatten(l1) U flatten(l2..ln), if l1 is list
; }

(defun flatten(l)
	(cond
		((null l) nil)
		((atom (car l)) (cons (car l) (flatten (cdr l))))
		((listp (car l)) (append (flatten (car l)) (flatten (cdr l)))) 
	)
)

;(print (flatten '(3 a (b 9 ( 9 c (6 (d 15) b 20)) 7))))

; div3(l : list) = {
; 	nil, if l == nil,
; 	l1 U div3(l2..ln), if l1 is a number and l1 % 3 == 0
; 	div3(l2..ln), otherwise
; }

(defun div3(l)
	(cond
		((null l) nil)
		((and (numberp (car l)) (= (mod (car l) 3) 0)) (cons (car l) (div3 (cdr l))))
		(t (div3 (cdr l)))
	)
)

; reverseList(l : list, acum : list) = {
; 	acum, if l == nil
; 	reverseList(l2..ln, l1 U acum), otherwise
; }

(defun reverseList(l acum)
	(cond
		((null l) acum)
		(t (reverseList (cdr l) (cons (car l) acum)))
	)
)

; removeOccurances(l : list, elem : atom){
; 	nil, if l == nil,
; 	removeOccurances(l2..ln, elem), if l1 == elem
; 	l1 U removeOccurances(l2..ln, elem), otherwise
; }

(defun removeOccurances(l elem)
	(cond
		((null l) nil)
		((= (car l) elem) (removeOccurances (cdr l) elem))
		(t (cons (car l) (removeOccurances (cdr l) elem)))
	)
)

; toSet(l : list) = {
; 	nil, if l == nil
; 	l1 U toSet(removeOccurances l, l1), otherwise
; }

(defun toSet(l)
	(cond
		((null l) nil)
		(t (cons (car l) (toSet (removeOccurances l (car l)))))
	)
)

;example
(print (toSet (reverseList (div3 (flatten '(3 a (b 9 ( 9 c (6 (d 15) b 20)) 7)))) '() )))

;empty list
(print (toSet (reverseList (div3 (flatten '())) '() )))

;no numbers % 3 
(print (toSet (reverseList (div3 (flatten '(1 a (b 1 ( 1 c (1 (d 1) b 1)) 1)))) '() )))

;only numbers % 3
(print (toSet (reverseList (div3 (flatten '(3 (6 (9 (12 (15) 18)) 21)))) '() )))
