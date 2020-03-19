;15. Determine the list of nodes accesed in postorder in a tree of type (2).

;(A (B) (C (D) (E)))

; Algorithm Postorder(tree)
;    1. Traverse the left subtree, i.e., call Postorder(left-subtree)
;    2. Traverse the right subtree, i.e., call Postorder(right-subtree)
;    3. Visit the root.


(defun preorder (L)
	(if (null L) nil (append (list (car L)) (preorder (cadr L)) (preorder (caddr L)) ))	
)

(defun inorder (L)
	(if (null L) nil (append (inorder (cadr L)) (list (car L)) (inorder (caddr L)) ))	
)

(defun postorder (L)
	(if (null L) nil (append (postorder (CADR L) ) (postorder (CADDR L) ) (list (car L)) ))
)

(print (preorder '(A (B) (C (D) (E)))))

(print (inorder '(A (B) (C (D) (E)))))

(print (postorder '(A (B) (C (D) (E)))))