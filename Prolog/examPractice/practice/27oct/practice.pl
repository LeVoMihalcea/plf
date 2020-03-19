%the last element of a list

lastElement([K], K).
lastElement([_|T], Output) :-
    lastElement(T, Output).

%the one before the last element
almostLastElement(X, [X,_]).
almostLastElement(X, [_, Y|Ys]) :-
    almostLastElement(X, [Y|Ys]).

%find k-th element
findIndex([H|_], 1, H).
findIndex([_|T], Index, Output) :- Index > 1,
    Index1 is Index - 1, findIndex(T, Index1, Output).

%find the length of a list
lengthList([], 0).
lengthList([_|T], Output) :-
    lengthList(T, Output1), Output is Output1 + 1.

%reverse a list
wrapperReverseList(L1, L2) :- reverseList(L1, L2, []).
reverseList([], Z, Z).
reverseList([H|T], Z, Acc) :- reverseList(T, Z, [H|Acc]).

%find out if a list is a palindrome or not
isPalindrome(L) :- wrapperReverseList(L, L).

%eliminate all occurances of an element
deleteOccurances([], _, []).
deleteOccurances([H|T], Element, Output) :- H =:= Element,
    deleteOccurances(T, Element, Output).
deleteOccurances([H|T], Element, Output) :- H =\= Element,
    deleteOccurances(T, Element, Output1), Output = [H|Output1].

%compress a list such that it doesnt have any consecutive duplicates
compress([], []).
compress([X], [X]).
compress([X, X|T], Output) :- compress([X|T], Output).
compress([X, Y|T1], [X|T2]) :- X \= Y,
    compress([Y|T1], T2).

%duplicate the elements of a list
duplicate([], []).
duplicate([H|T], Output) :-
    duplicate(T, Output1), Output = [H,H|Output1].

%delete every n-th element of a list
deleteNthLoop([], _, _,  []).
deleteNthLoop([_|T], N, K, Output) :- N =:= 1,
    deleteNthLoop(T, K, K, Output).
deleteNthLoop([H|T], N, K, Output) :- N =\= 1,
    N1 is N - 1,deleteNthLoop(T, N1, K,  Output1), Output = [H|Output1].

%split a list into two sublists, the length of the first list is given
split([], _, [], []).
split([H|T], K, List1, List2) :- K > 0,
    K1 is K - 1, split(T, K1, List11, List2), List1 = [H|List11].
split([H|T], K, List1, List2) :- K =:= 0,
    split(T, 0, List1, List22), List2 = [H|List22].

%extract a slice from a list
slice([], _, _, _, []).
slice([H|T], Min, Max, Current, Output) :- Current > Min, Current < Max,
    Current1 is Current + 1, slice(T, Min, Max, Current1, Output1), Output = [H|Output1].
slice([_|T], Min, Max, Current, Output) :- Current < Min,
      Current1 is Current + 1, slice(T, Min, Max, Current1, Output).
slice([_|T], Min, Max, Current, Output) :- Current > Max,
      Current1 is Current + 1, slice(T, Min, Max, Current1, Output).
