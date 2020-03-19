/*
 * 1. a. Transform a list in a set.
 * b. Determine the union of two sets. The sets are represented as
 * lists.
*/


removeOcc([], _, []).
removeOcc([H|T], ToDelete, Output):- H=:=ToDelete,
    removeOcc(T, ToDelete, Output).
removeOcc([H|T], ToDelete, Output):- H=\=ToDelete,
    removeOcc(T, ToDelete, Output1), Output = [H|Output1].

listToSet2([], []).
listToSet2([H|T], [H|R]) :-
    removeOcc(T, H, Output),
    listToSet(Output, R).
