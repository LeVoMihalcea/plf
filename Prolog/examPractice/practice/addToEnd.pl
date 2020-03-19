addToEnd([], ToAdd, [ToAdd]).

addToEnd([H|T], ToAdd, Output) :-
    addToEnd(T, ToAdd, Output1), Output = [H|Output1].
