% 6. Generate the list of all arrangements of K elements of a given list.
% Eg: [2, 3, 4] K=2 => [[2,3], [3,2], [2,4], [4,2], [3,4], [4,3]] (not necessary in this order)

% insert(l1...ln, e) =
%	[e], n = 0
%	e + l1...ln, n >= 1
%	l1 + insert(l2...ln, e), otherwise

% insert(L:list, E:number, R:list)
% insert(i, i, o)

insert([], E, [E]).
insert([H|T], E, [E,H|T]).
insert([H|T], E, [H|R]) :-
         insert(T, E, R).

% permutations(l1...ln) =
%	[], n = 0
%	insert(permutations(l2...ln), l1), otherwise
%
% permutations(L:list, R:list)
% permutations(i, o)

permutations([], []).
permutations([H|T], R) :-
    permutations(T, RP),
    insert(RP, H, R).

% combinations(l1...ln, k) =
%	[], k = 0
%	l1 + combinations(l2...ln, k - 1), k > 0
%	combinations(l2...ln, k), k > 0
%
% combinations(L:list, K:number, R:list)
% combinations(i, o)

combinations(_, 0, []).
combinations([H|T], K, [H|R]) :-
    K > 0,
    NK is K - 1,
    combinations(T, NK, R).
combinations([_|T], K, R) :-
    K > 0,
    combinations(T, K, R).

% arangements(L:list, K:number, R:list)
% arangements(i, i, o)

arangements(L, K, R) :-
    combinations(L, K, RC),
    permutations(RC, R).

% main(L:list, N:number, R:list)
% main(i, i, o)

main(L, N, R) :-
    findall(RPartial, arangements(L, N, RPartial), R).











