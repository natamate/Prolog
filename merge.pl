
 merge2([H1|T1],[H2|T2],[H1|T]):-
	H1 < H2, !,
	merge2(T1,[H2|T2],T).
 merge2([H1|T1],[H2|T2],[H2|T]):-
	merge2([H1|T1],T2,T),!.
 merge2(X,[],X):-!.
 merge2([],X,X).
 
student(szymon, agh).
student(krzysiek, agh).
student(weronika, agh).
student(kasia, agh).
student(szymon, agh).
fajni_studenci :- student(X,agh),write(X),nl,fail, write(' nie jest fajny'),!.
fajni_studenci :- write('oni sa fajni').

kocha(marcellus, mia).
kocha(vincent,mia).
zazdrosny(X,Y) :-kocha(X,Z),kocha(Y,Z).



wczyt_im:-
	consult('learner_kb.pl'),
	write('podaj imie'), nl,
	read(X),
	answer(X).

answer(stop):-write('Koncze'),nl,!.
	
answer(X):-
	imie(X),
	write(X),
	write(' jest w bazie'), nl,
	wczyt_im.
	
answer(X):-
	\+imie(X),
	assert(imie(X)),
	write('dodano '), listing(imie), nl,
	wczyt_im.

poznaj_slowo:-
	consult('learner_kb.pl'),
	write('Proszê podaj s³owo'), nl,
	read(X), sprawdz(X).

sprawdz(X):-
	definicja(X,_),
	write('Dziêkujê ale to ju¿ mam'), nl,!.
	
sprawdz(X):-
	% \+definicja(X,_),
	write('A co to znaczy?'), nl,
	read(Y),
	assert(definicja(X,Y)),
	listing(definicja).
	
a([_,X|_],W):-
	X=[_,_,W|_].
	
b([_,_,X|_],W):-
	X=[_,W|_].
	
nalezy(H,[H|_]).
nalezy(X,[_|Lista]):- nalezy(X,Lista).
sumuj([X],X).
sumuj([H|Lista],Wynik):-
	nalezy(X,[H|Lista]), sumuj(Lista,WynikNizej),
	Wynik is WynikNizej+X,!.
	
sklej([],H,H).
sklej([H|L1],L2,[H|L3]):-
	sklej(L1,L2,L3).
	
removeLastThree(L,Result):-
	sklej(Result,[_,_,_],L).
	
removeFirstThree(L,Result):-
	sklej([_,_,_],Result,L).
	
removeThree(L,L2):-
	sklej([_,_,_],Tmp,L),
	sklej(L2,[_,_,_],Tmp).
	
dlugosc([],0).
dlugosc([_|T],Wynik):-
	dlugosc(T,Wynik2),
	Wynik is Wynik2 + 1.
	
parzysta(L):-
	dlugosc(L, X), X mod 2 =:= 0.

nieparzysta(L):-
		\+ parzysta(L).
		
odwroc([],[]).
odwroc([H|T],Result):-
	odwroc(T,Tmp),
	sklej(Tmp,[H],Result).
	
palindrom(L):-
	odwroc(L,L).
	
przesun([H|T],L2):-
	sklej(T,[H],L2).
	
przesunv2(L1,L2):-
	odwroc(L1,Tmp),
	przesun(Tmp,Tmp2),
	odwroc(Tmp2,L2).
	
 znaczy(0,zero).   znaczy(1,jeden).
 znaczy(2,dwa).    znaczy(3,trzy).
 znaczy(4,cztery). znaczy(5,piec).
 znaczy(6,szesc).  znaczy(7,siedem).
 znaczy(8,osiem).  znaczy(9,dziewiec).
	
		przeloz([],[]).
		przeloz([H|T],[H2|T2]):-
			znaczy(H,H2),
			przeloz(T,T2).
			
	% czy Z zawiera sie w L
podzbior(L,Z):-
	sklej(_,L2,L),
	sklej(Z,_,L2).
	
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
		
podziel_ver1([], [], []).
podziel_ver1([H], [H], []).
podziel_ver1([H1,H2|T], [H1|L1], [H2|L2]):-
	podziel_ver1(T, L1, L2).
	
podziel_ver2(L,L1,L2):-
	sklej(L1,L2,L),
	dlugosc(L1,D),
	dlugosc(L2,D).
	
podziel_ver2(L,L1,L2):-
	sklej(L1,L2,L),
	dlugosc(L1,D),
	dlugosc(L2,X),
	X is D - 1.
	
	

		
		
