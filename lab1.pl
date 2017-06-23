rodzic(tomek, robert).
rodzic(kasia, robert).
rodzic(tomek, eliza).
rodzic(robert, anna).
rodzic(robert, magda).
rodzic(magda, jan).
rodzic(jan, joanna).

kobieta(kasia).
kobieta(eliza).
kobieta(magda).
kobieta(anna).

mezczyzna(robert).
mezczyzna(tomek).
mezczyzna(jan).

matka(X,Y):-
	kobieta(X), rodzic(X,Y).
	
ojciec(X,Y):- 
	mezczyzna(X), rodzic(X,Y).
	
brat(X,Y):-
	mezczyzna(X), rodzic(Z,X), rodzic(Z,Y), X\=Y.
	
siostra(X,Y):-
	kobieta(X), rodzic(Z,X), rodzic(Z,Y), X\=Y.
	
babcia(X,Y):-
	kobieta(X), rodzic(X,Z), rodzic(Z,Y).

dziadek(X,Y):-
	mezczyzna(X), rodzic(X,Z), rodzic(Z,Y).
	
%X jest przodkiem Y	
przodek(X,Y):-
	rodzic(X,Y).
	
przodek(X,Y):-
	rodzic(X,Z), przodek(Z,Y).
	
potomek(X,Y):- 
	rodzic(Y,X).
	
potomek(X,Y):-
	rodzic(Y,Z), potomek(X,Z).
	