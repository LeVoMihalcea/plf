minFromList([H], H).
minFromList([H|T], M) :-
    minFromList(T, M1),
    M is max(M1, H).

pickMinAndDelete([], _, []).
pickMinAndDelete([H|T], Min, Output) :- Min =:= H,
    pickMinAndDelete(T, Min, Output).
pickMinAndDelete([H|T], Min, Output) :- Min =\= H,
    pickMinAndDelete(T, Min, Output1),
    Output = [H|Output1].

pickMinAndDeleteOnce([], _, []).
pickMinAndDeleteOnce([H|T], Min, Output) :- Min =:= H,
    Output = T.
pickMinAndDeleteOnce([H|T], Min, Output) :- Min =\= H,
    pickMinAndDeleteOnce(T, Min, Output1),
    Output = [H|Output1].

mySort([], Acc, Acc).
mySort([H|T], Acc, Output) :-
    minFromList([H|T], Minimum),
    pickMinAndDeleteOnce([H|T], Minimum, Output1),
    mySort(Output1, [Minimum|Acc], Output).

sortEverySublist([], []).
sortEverySublist([H|T], Output) :- is_list(H),
    mySort(H, [], SortedList),
    sortEverySublist(T, Output1),
    Output = [SortedList|Output1].
sortEverySublist([H|T], Output) :-
    sortEverySublist(T, Output1),
    Output = [H|Output1].



