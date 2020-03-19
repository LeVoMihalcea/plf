deleteAll([], _, []).
deleteAll([H|T], E, R) :- H=:=E,
    deleteAll(T, E, R1), R = R1.
deleteAll([H|T], E, R) :- H=\=E,
    deleteAll(T, E, R1), R = [H|R1].
