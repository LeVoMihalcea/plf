/*addToEnd(l1..ln, val) = {
 *     [val], l = Nil
 *     l1 U addToEnd(l2..ln, val), otherwise
 * }
 *addToEnd(l : list, val : int, n : list)
 *addToEnd(i, i, o)
*/

addToEnd2([], Val, [Val]).
addToEnd2([H|T], Val, S) :-
    addToEnd2(T, Val, S1), S = [H|S1].

/*concLists(l1..ln, k1..kn) = {
 *     k1 , l = Nil and k = [k1]
 *     k1 U concLists([], k2..kn), l = Nil
 *     l1 U concLists(l2..ln, k1..kn) otherwise
 *}
 *
 *concLists(l : list, k : list, s : list)
 *flow concLists(i, i, o)
*/

concLists([], K, K).
concLists([H|T], K, [H|R]) :-
    concLists(T, K, R).
