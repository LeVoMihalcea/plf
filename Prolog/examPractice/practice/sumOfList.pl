sumList([], 0).

sumList([H|T], Sum) :-
    sumList(T, SumList), Sum is H + SumList.
