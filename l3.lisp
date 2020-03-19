; 6. Write a function that returns the maximum of numeric atoms in a list, at any level.

; maxFromList(elem) = {
; 	elem, if elem is number
; 	0, if elem is atom
; 	max(mapcar elem), if elem is a list
; }

; (maxFromList '(5 3 (8 A (B 2 (C))))) => 8
(defun maxFromList (elem)
	(cond
		; number
		((numberp elem) elem)
		
		; atom
		((atom elem) 0)
		
		; list
		((listp elem) (apply 'max (mapcar 'maxFromList elem)))
		
	)
)

(print (maxFromList '(5 3 (8 A (B 2 (C)))))) 