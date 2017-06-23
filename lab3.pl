%Wybieranie 2 i 5 elementu listy

g25([_,A,_,_,B|_],Drugi,Piaty):-
	Drugi = A, Piaty = B.
	
%Porownywanie 3 i 4 elementu listy
cmp34([_,_,A,B|_]):-
	A =:= B.
	
%Zamienie 3 i 4 elementu listy
switch34([A,B,C,D|E],X):-
	X = [A,B,D,C|E].
	
%Przynaleznosc do listy
nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).	
	
%Take the n-th element of the list

take(1,[H|_],H):-!.
take(N,[_|T],Element):-
	N1 is N-1, take(N1, T, Element).
	
%list's dlugosc

dlugosc([],0).
dlugosc([_|T],L):-
	dlugosc(T,L2), L is L2+1.
	
%Rekurencyjna analiza list
a2b([],[]).
a2b([a|Ta],[b|Tb]) :- 
   a2b(Ta,Tb).
   
 %Sklejanie elementów
 
 sklej([],X,X).
 sklej([X|L1],L2,[X|L3]):-
	sklej(L1,L2,L3).
	
append([],L,L).
append([H|T],L,[H|TL]) :- append(T,L,TL).


%za pomoca sklej
nalezy1(X,L):- 
	sklej(_,[X|_],L).
	
%zdefiniowac predykat

ostatni(Element,[Element]).
ostatni(Element,[_|T]):-
	ostatni(Element,T).

%za pomoca sklej	
ostatniV2(Element,Lista):-
	sklej(_,[Element], Lista).
	
%Dodawanie elementów
dodaj(X,L,[X|L]).

%Usuwanie 
usun(X,[X|Reszta],Reszta).
usun(X,[Y|Ogon],[Y|Reszta]) :-
	usun(X,Ogon,Reszta).

usunV2(X,Lista,Result):-
	sklej(A,[X|B],Lista),
	sklej(A,B,Result).
	

wstaw(X,L,Duza) :-
	usun(X,Duza,L).
	
nalezy2(X,L) :-
	usun(X,L,_).
	
%Zawieranie list
zawiera(S,L) :- %jesli S zawiera sie w L
	sklej(_,L2,L), % to mozna skleic cokolwiek i liste L2 w L
	sklej(S,_,L2). % i wtedy z S i czegos mozna uzyskac L2
	
%Put X as the k1-th element to L
putK(X,1,L,[X|L]):-!.
putK(X,K,[H|L],[H|LX]):-
	K1 is K-1, putK(X,K1,L,LX).
	
%Delete one X from L
del(X,[X|L],L).
del(X,[Y|L],[Y|L2]):-
	del(X,L,L2).
	
%Delete all X from L
delAll(_,[],[]):-!.
delAll(X,[H|L],[H|L2]):-
	X \= H, !, delAll(X,L,L2).
delAll(X,[X|L],[LL]):-delAll(X,L,LL).

%Checking for a sublist
sublist(S,FSL,F,L):-
	append(F,SL,FSL),
	append(S,L,SL).

%Permutacja
permutacja([],[]).
permutacja([X|L],P) :-
	permutacja(L,L1),
	wstaw(X,L1,P).
 
permutacja2([],[]).
permutacja2(L,[X|P]) :-
	usun(X,L,L1),
	permutacja2(L1,P).
	
%Oddwracanie listy
odwroc([],[]).
odwroc([Head|Tail],Result):-
	odwroc(Tail,TmpResult),
	sklej(TmpResult,[Head],Result).
	
wypisz([H|T]) :-
	put(H), wypisz(T).
wypisz([]).