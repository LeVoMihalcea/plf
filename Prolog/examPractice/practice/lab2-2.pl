lenList([], 0).
lenList([_|T], N) :- lenList(T, N1), N is 1+N1.
