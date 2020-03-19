/*
 * Generate the list of all arrangements of K elements of a given list.
 *Eg: [2, 3, 4] K=2 => [[2,3], [3,2], [2,4], [4,2], [3,4], [4,3]] (not
 *necessary in this order)
*/

/*
 * insert(l1..ln, k) =
 *     [k], l = Nil
 *     k + l1..ln, n >= 1
 *     l1 + insert(l2..ln, k), otherwise
 * insert(L : list, K : integer, Output : list)
 * insert(i, i, o)
*/

insert([], K, [K]).
insert([H|T], K, [K,H|T]).
insert([H|T], K, [H|R]) :-
    insert(T, K, R).


/*
 * permutations(l1..ln) =
 *     [], l = Nil
 *     insert(permutari(l2..ln), l1) otherwise
