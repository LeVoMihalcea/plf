%factorial(N : integer, Output : integer)
%flow (I, O)
%
%factorial(N, Output) {
%    1, N = 0
%    N * factorial(N-1), otherwise
%}
%
factorial(0, 1).
factorial(N, Output) :-
    NewN is N - 1,
    factorial(NewN, Output1),
    Output is Output1 * N.

%replace(L : list, I : integer, Output : List)
%flow : replace(i, i, o)
%
%replace(L, I, O) = {
%    [], L = nil
%    factorial(I) U replace(L2..Ln), I%2==1
%    L1 U replace(L2..Ln), I%2==0
%}
%
%
%predicate that given a numerical linear list of ints,
%replaces all the elements from odd positions with the factorial
%of the position's index

%note : I is where the indexing starts, problems asks to run it with 1
%can also be used for lists starting from 0

replace([], _, []).
replace([_|T], I, Output) :- I mod 2 =:= 1,
    NewI is I + 1,
    replace(T, NewI, Output1),
    factorial(I, Result),
    Output = [Result|Output1].
replace([H|T], I, Output) :- I mod 2 =:= 0,
    NewI is I + 1,
    replace(T, NewI, Output1),
    Output = [H|Output1].















