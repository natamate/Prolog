
sklej([],X,X).
sklej([X|L1],L2,[X|L3]):-
	sklej(L1,L2,L3).
	
%zdefiniowaæ predykat, powoduj¹cy usuniêcie 3 ostatnich elementów %listy L, w wyniku powstaje lista L1, u¿yæ sklej.

remove3Last(L,L1):-
	sklej(L1, [_,_,_], L).
	
%zdefiniowaæ predykat, powoduj¹cy usuniêcie 3 pierwszych elementów %listy L, w wyniku powstaje lista L1, u¿yæ sklej.

remove3First(L,L1):-
	sklej([_,_,_], L1, L).
	
%zdefiniowaæ predykat, powoduj¹cy usuniêcie 3 pierwszych i %ostatnich elementów listy L, w wyniku powstaje lista L2, u¿yæ %sklej.

remove3(L,L2):-
	sklej(L1, [_,_,_], L),
	sklej([_,_,_],L2, L1).
	
%zdefiniowaæ parê komplementarnych predykatów nieparzysta(L) oraz%parzysta(L) sprawdzajacych czy argument jest list¹ o %odpowiednio (nie)parzystej d³ugoœci.

dlugosc([],0).
dlugosc([_|T],L):-
	dlugosc(T,L2), L is L2 + 1.
	
parzysta(L):-
	dlugosc(L,X), X mod 2 =:= 0.
	
nieparzysta(L):-
	\+ parzysta(L).
	
%zdefiniowaæ predykat palindrom(L), L jest palindromem, je¿eli %czyta siê tak samo od przodu i ty³u,

odwroc([],[]).
odwroc([H|T], Result):-
	odwroc(T,R),
	sklej(R,[H],Result).
	
palindrom(L):-
	odwroc(L,L).
	
%zdefiniowaæ predykat przesun(L1,L2), gdzie L2, jest przesuniêt¹ %rotacyjnie o jeden element L1,

przesun([],[]).	
przesun([H|T],L2):-
	sklej(T,[H],L2).
	
% zdefiniowaæ predykat przeloz(L1,L2), który zamienia listê liczb% (max. 0-9), na listê s³ów.
 znaczy(0,zero).   znaczy(1,jeden).
 znaczy(2,dwa).    znaczy(3,trzy).
 znaczy(4,cztery). znaczy(5,piec).
 znaczy(6,szesc).  znaczy(7,siedem).
 znaczy(8,osiem).  znaczy(9,dziewiec).

przeloz([],[]).
przeloz([X|XS],[Y|YS]) :-
	znaczy(X,Y),
	przeloz(XS,YS).
	
%zdefiniowaæ predykat podzbior(L,Z), który sprawdza, czy Z zawiera siê w L, oraz wypisuje wszystkie %mo¿liwe podzbiory L (je¿eli Z jest niewiadoma).
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
	
%zdefiniowaæ predykat podziel(L,L1,L2), który dzieli listê L, na dwa fragmenty L1 i L2, mniej wiêcej %równej d³ugoœci (z dok³adnoœci¹ do jednego el.), np.:		

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