noOcc([], _, 0).
noOcc([H|T], E, N) :- H==E,
    noOcc(T, E, N1),  N is N1+1.
noOcc([H|T], E, N) :- H\=E,
    noOcc(T, E, N).
