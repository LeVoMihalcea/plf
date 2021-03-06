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
/*
 * 5.
 *a. Substitute all occurrences of an element of a list with all the
  elements of another list. *Eg. subst([1,2,1,3,1,4],1,[10,11],X)
  produces X=[10,11,2,10,11,3,10,11,4].
 *b. For a heterogeneous list,
  formed from integer numbers and list of numbers, replace in every
  sublist all occurrences of the first element from sublist it a new
  given list. *Eg.: [1, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1],
  7] si [11, 11] => *[1, [11, 11, 1, 11, 11], 3, 6, [11, 11, 10, 1, 3,
  9], 5, [11 11 11 11 11 11], 7]
*/

/*
 *subst(L:list, T:atom, K:list, Output:list)
 *subst(i, i, i, o)
 *
 *subst(L, B, K){
 *    [], if L = Nil,
 *    l1 U subst(l2..ln, B, K), if l1 != B
 *    K U subst(l2..ln, B, K), if l1 == B
*/

subst([], _, _, []).
subst([H|T], B, K, Output) :- H =:= B,
    subst(T, B, K, Output1), concLists(K, Output1, Output).
subst([H|T], B, K, [H|Output]) :- H =\= B,
    subst(T, B, K, Output).

/*
 * betterSubst(L:list, K:list, Output:list)
 * betterSubst(i, i, o)
 *
 * betterSubst(L, K, Output){
 *     [], if L = Nil
 *     subst(L1, L11) U betterSubst(L2..Ln, K, Output), L1 is list
 *     L1 U betterSubst(L2..Ln, K, Output), otherwise
 * }
*/

betterSubst([], _, []).
betterSubst([[H|T1]|T2], K, Output) :- is_list([H|T1]),
    subst([H|T1], H, K, Output1), betterSubst(T2, K, Output2),
    Output = [Output1|Output2].
betterSubst([H|T], K, [H|Output]) :- betterSubst(T, K, Output).



