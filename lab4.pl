
sklej([],X,X).
sklej([X|L1],L2,[X|L3]):-
	sklej(L1,L2,L3).
	
%zdefiniowa� predykat, powoduj�cy usuni�cie 3 ostatnich element�w %listy L, w wyniku powstaje lista L1, u�y� sklej.

remove3Last(L,L1):-
	sklej(L1, [_,_,_], L).
	
%zdefiniowa� predykat, powoduj�cy usuni�cie 3 pierwszych element�w %listy L, w wyniku powstaje lista L1, u�y� sklej.

remove3First(L,L1):-
	sklej([_,_,_], L1, L).
	
%zdefiniowa� predykat, powoduj�cy usuni�cie 3 pierwszych i %ostatnich element�w listy L, w wyniku powstaje lista L2, u�y� %sklej.

remove3(L,L2):-
	sklej(L1, [_,_,_], L),
	sklej([_,_,_],L2, L1).
	
%zdefiniowa� par� komplementarnych predykat�w nieparzysta(L) oraz%parzysta(L) sprawdzajacych czy argument jest list� o %odpowiednio (nie)parzystej d�ugo�ci.

dlugosc([],0).
dlugosc([_|T],L):-
	dlugosc(T,L2), L is L2 + 1.
	
parzysta(L):-
	dlugosc(L,X), X mod 2 =:= 0.
	
nieparzysta(L):-
	\+ parzysta(L).
	
%zdefiniowa� predykat palindrom(L), L jest palindromem, je�eli %czyta si� tak samo od przodu i ty�u,

odwroc([],[]).
odwroc([H|T], Result):-
	odwroc(T,R),
	sklej(R,[H],Result).
	
palindrom(L):-
	odwroc(L,L).
	
%zdefiniowa� predykat przesun(L1,L2), gdzie L2, jest przesuni�t� %rotacyjnie o jeden element L1,

przesun([],[]).	
przesun([H|T],L2):-
	sklej(T,[H],L2).
	
% zdefiniowa� predykat przeloz(L1,L2), kt�ry zamienia list� liczb% (max. 0-9), na list� s��w.
 znaczy(0,zero).   znaczy(1,jeden).
 znaczy(2,dwa).    znaczy(3,trzy).
 znaczy(4,cztery). znaczy(5,piec).
 znaczy(6,szesc).  znaczy(7,siedem).
 znaczy(8,osiem).  znaczy(9,dziewiec).

przeloz([],[]).
przeloz([X|XS],[Y|YS]) :-
	znaczy(X,Y),
	przeloz(XS,YS).
	
%zdefiniowa� predykat podzbior(L,Z), kt�ry sprawdza, czy Z zawiera si� w L, oraz wypisuje wszystkie %mo�liwe podzbiory L (je�eli Z jest niewiadoma).
nalezy([X|_], X).
nalezy([_|T], Y) :-
	nalezy(T, Y).

remove_first_X(X, [X|T], T).
remove_first_X(X, [Y|T], [Y|Tn]) :-
	X \= Y,
	remove_first_X(X, T, Tn).

podzbior_ver1(_, []).
podzbior_ver1(X,[H|T]) :-
	nalezy(X, H),
	remove_first_X(H, X, N),
		podzbior_ver1(N,T).

podzbiorV2(S,L) :- %jesli S zawiera sie w L
	sklej(_,L2,L), % to mozna skleic cokolwiek i liste L2 w L
	sklej(S,_,L2). % i wtedy z S i czegos mozna uzyskac L2
	
%zdefiniowa� predykat podziel(L,L1,L2), kt�ry dzieli list� L, na dwa fragmenty L1 i L2, mniej wi�cej %r�wnej d�ugo�ci (z dok�adno�ci� do jednego el.), np.:		

podziel_ver1([], [], []).
podziel_ver1([H], [H], []).
podziel_ver1([H1,H2|T], [H1|L1], [H2|L2]):-
	podziel_ver1(T, L1, L2).


podziel_ver2(L, L1, L2):-
	sklej(L1, L2, L),
	dlugosc(L1, D),
	dlugosc(L2, D).

podziel_ver2(L, L1, L2):-
	sklej(L1, L2, L),
	dlugosc(L1, D),
	dlugosc(L2, X),
	X is D-1.