lastElement([H], H).
lastElement([_|T], Output) :- lastElement(T, Output).

kthElement([H|_], 1, H).
kthElement([_|T], K, Output) :- K > 0,
    NewK is K - 1,
    kthElement(T, NewK, Output).

reverseAList([], Accumulator, Accumulator).
reverseAList([H|T], Acumulator, Output) :-
    reverseAList(T, [H|Acumulator], Output).

palindrome(L) :- reverseAList(L, [], L).

removeAllOccurances([], _, []).
removeAllOccurances([H|T], Elem, Output) :- H =:= Elem,
    removeAllOccurances(T, Elem, Output).
removeAllOccurances([H|T], Elem, Output) :- H =\= Elem,
    removeAllOccurances(T, Elem, Output1), Output = [H|Output1].

f([], 0).
f([H|T], S) :-
    f(T, S1), S is S1-H.
