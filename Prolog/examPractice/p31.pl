minsert([], E, [E]).
minsert([H|T], E, [E, H|T]).
minsert([H|T], E, [H|Tr]) :-
    minsert(T, E, Tr).

perm([], []).
perm([H|T], R) :-
    perm(T, Rt),
    minsert(Rt, H, R).

comb(_, 0, []).
comb([H|T], K, [H|Tr]) :-
    K > 0,
    K1 is K - 1,
    comb(T, K1, Tr).
comb([_|T], K, R) :-
    K > 0,
    comb(T, K, R).

solution(L, K, O) :-
    findall(L1, comb(L, K, L1), O).
