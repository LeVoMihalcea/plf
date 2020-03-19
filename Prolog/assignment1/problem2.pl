/*
 *
 * 2. a. Substitute the i-th element from a list, with a value v.
 * b. Determine difference of two sets represented as lists.
*/

%replace(L : list, Count : int, I : int, V : int, Output : list)
%replace(i, i, i, i, o)
replace([], _, _, _, []).
replace([H|T], Count, I, V, Output) :- Count =/= I,
    replace(T, Count1, I, V, Output1), Count

