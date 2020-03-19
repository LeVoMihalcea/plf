mountain([_], 1).
mountain([H1, H2|T], 0) :-
    H1 < H2,
    mountain([H2|T], 0).
mountain([H1, H2|T], 0) :-
    H1 >= H2,
    mountain([H2|T], 1).
mountain([H1, H2|T], 1) :-
    H1 > H2,
    mountain([H2|T], 1).


removeOdds([], []).
removeOdds([H|T], Output) :- H mod 2 =:= 0,
    removeOdds(T, Output1),
    Output = [H|Output1].
removeOdds([H|T], Output) :- H mod 2 =:= 1,
    removeOdds(T, Output).
