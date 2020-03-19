%Find the last element of a list.
lastElement([H], H).
lastElement([_|T], Output) :- lastElement(T, Output).

%penultimul element
penultimulElement([P, _], P).
penultimulElement([_, P|Rest], Output) :-
    penultimulElement([P|Rest], Output).

%al k-lea element
kElement([H|_], 1, H).
kElement([_|T], K, Output) :- K > 1,
    K1 is K - 1, kElement(T, K1, Output).

%lungimea unei liste
lungLista([], 0).
lungLista([_|T], Lungime) :-
    lungLista(T, Lungime1), Lungime is Lungime1 + 1.

%reversul unei liste

wrapperReversLista(L1, L2) :- reversLista(L1, L2, []).
reversLista([], Z, Z).
reversLista([H|T], Output, Acumulator) :-
    reversLista(T, Output, [H|Acumulator]).

%daca lista e palindrom
palindromLista(L) :- wrapperReversLista(L, L).

%sterge toate aparitiile lui k
stergeK([], _, []).
stergeK([H|T], K, Output) :- H =:= K,
    stergeK(T, K, Output).
stergeK([H|T], K, Output) :- H =\= K,
    stergeK(T, K, Output1), Output = [H|Output1].

%compreseaza o lista astfel incat sa nu existe duplicate consecutive
stergeDuplicate([], []).
stergeDuplicate([H], [H]).
stergeDuplicate([H, H|T], Output) :-
    stergeDuplicate([H|T], Output).
stergeDuplicate([H, K|T], Output) :- H \= K,
    stergeDuplicate([K|T], Output1), Output = [H|Output1].

%adauga la sfarsitul listei
adauga([], K, [K]).
adauga([H|T], K, Output) :-
    adauga(T, K, Output1), Output = [H|Output1].

%pune duplicatele intr o sublista
%TODO 9
adaugaDuplicate([], []).
adaugaDuplicate([K], [K]).

%dubleaza elementele unei liste
dubleaza([], []).
dubleaza([H|T], Output) :-
    dubleaza(T, Output1), Output = [H,H|Output1].

%multiplica cu k o lista
multiK(_, 0, _).
multiK(E, K, Output) :-
    K1 is K - 1,
    multiK(E, K1, Output1),
    Output = [E|Output1].

%adauga elementele unei liste la inceputul altei liste
adaugaLista([], K, K).
adaugaLista([H|T], Lista, [H|Output]) :-
    adaugaLista(T, Lista, Output).

%multiplica de k ori fiecare element din lista
multiKLista([], _, []).
multiKLista([H|T], K, Output) :-
    multiK(H, K, DeAdaugat),
    multiKLista(T, K, Output2),
    adaugaLista(DeAdaugat, Output2, Output).

bubblesort2(Rel, List, SortedList) :-
    swap2(Rel, List, NewList), % this now always succeeds
    List \= NewList, !, % check there�s been a swap
    bubblesort2(Rel, NewList, SortedList).
bubblesort2(_, SortedList, SortedList).
swap2(Rel, [A,B|List], [B|NewList]) :-
    check(Rel, B, A),
    swap2(Rel, [A|List], NewList). % continue!
swap2(Rel, [A|List], [A|NewList]) :-
    swap2(Rel, List, NewList).
swap2(_, [], []). % new base case: reached end of list
