minsert([], E, [E]).
minsert([H|T], E, [E,H|T]).
minsert([H|T], E, [H|Output]) :-
    minsert(T, E, Output).

perm([], []).
perm([H|T], Output) :-
    perm(T, Output1),
    minsert(Output1, H, Output).

comb(_, 0, []).
comb([H|T], K, [H|Output]) :-
    K > 0,
    K1 is K - 1,
    comb(T, K1, Output).
comb([_|T], K, Output) :-
    K > 0,
    comb(T, K, Output).

arr(L, K, Output) :-
    comb(L, K, Output1),
    perm(Output1, Output).

sum([], S, S).
sum([H|T], S, Output) :-
    S1 is H + S,
    sum(T, S1, Output).

solution(L, K, S, Output) :-
    arr(L, K, Output),
    sum(Output, 0, S).


