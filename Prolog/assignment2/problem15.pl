/*
 * 15.
a. Write a predicate to transform a list in a set, considering the first occurrence.
Eg: [1,2,3,1,2] is transform in [1,2,3].
b. Write a predicate to decompose a list in a list respecting the following: [list of even numbers list of odd
numbers] and also return the number of even numbers and the numbers of odd numbers.
*/

% UTILS

/*removeOcc(L : list, E : number, R : list)
 *removeOcc(i, i, o)
 *
 *removeOcc(L, E) = {
 *   [], L = Nil
 *   removeOcc(L2..LN, E), L1 == E
 *   L1 U removeOcc(L2..LN, E), otherwise
*/

removeOcc([], _, []).
removeOcc([H|T], E, Output) :- H =:= E,
    removeOcc(T, E, Output).
removeOcc([H|T], E, Output) :-
    removeOcc(T, E, Output1), Output = [H|Output1].


% A

/*listToSet(L : list, R : list)
 *listToSet(i, o)
 *
 *listToSet(L) = {
 *    [] , L = Nil
 *    L1 U listToSet(removeOcc(L2..LN, L1))
 *}
*/

%if list is empty, just finish everything
listToSet([], []).
%if list is not empty, then just unite the first element with
%the list returned by removing every occurance from the rest
%of the list
listToSet([H|T], [H|R]) :-
    removeOcc(T, H, R1),
    listToSet(R1, R).

% B
/*
 * decompList(L : list, Evens : list, Odds : list, nrEvens : int, nrOdds
 * : int)
 * decompList(i, o, o, o, o)
 *
 * decompList(l) = {
 *     [], [], 0, 0, l = Nil
 *     {
 *         decompList(l2..ln)
 *         nrEvens + 1
 *         l1 U evenList
 *     } if l1 is even
 *     {
 *         decompList(l2..ln)
 *         nrOdds + 1
 *         l2 U oddList
 *     }
 * }
*/

decompList([], [], [], 0, 0).
decompList([H|T], [H|H1], H2, Evens1, Odds) :- H mod 2 =:= 0,
    decompList(T, H1, H2, Evens, Odds), Evens1 is Evens + 1.
decompList([H|T], H1, [H|H2], Evens, Odds1) :- H mod 2 =:= 1,
    decompList(T, H1, H2, Evens, Odds), Odds1 is Odds + 1.




















