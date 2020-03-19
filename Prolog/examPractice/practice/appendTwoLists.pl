appendTwoLists([], [X], [X]).
appendTwoLists([H|T], _, Output) :-
    appendTwoLists(T, _, Output1), Output = [
