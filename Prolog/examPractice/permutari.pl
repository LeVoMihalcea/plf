minsert([], E, [E]).
minsert([H|T], E, [E,H|T]).
minsert([H|T], E, [H|Tr]) :-
    minsert(T, E, Tr).

perm([], []).
perm([H|T], R) :-
    perm(T, RT),
    minsert(RT, H, R).

produs([], C, C).
produs([H|T], C, Output) :-
    C1 is H * C,
    produs(T, C1, Output).

suma([], C, C).
suma([H|T], S, O) :-
    S1 is H + S,
    suma(T, S1, O).

comb(_, 0, []).
comb([H|T], K, [H|Tr]) :-
    K > 0,
    K1 is K - 1,
    comb(T, K1, Tr).
comb([_|T], K, R) :-
    K > 0,
    comb(T, K, R).

arr(L, K, R) :-
    comb(L, K, R1),
    perm(R1, R).

onesol(L, K, P, S, O) :-
    arr(L, K, O),
    suma(O, 0, S),
    produs(O, 1, P).

solution(L, K, P, S, Output) :-
    findall(RL, onesol(L, K, P, S, RL), Output).
