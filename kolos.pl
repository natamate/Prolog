ksi��ka(16, 'Flatlandia', autor('Edvin Abbot', 1838-1926),wydanie('Sell & Co',1884)).
ksi��ka(28, 'R. U. R.', autor('Karel Capek', 1890-1938),wydanie('Palyers Press',2002)).
ksi��ka(34, 'Kobieta z wydm', autor('Kobo Abe', 1924-1993),wydanie('Wydawnictwo Znak',2007)).
ksi��ka(36, 'Zamek', autor('Frans Kafka', 1883-1924),wydanie('Zielona Sowa',2001)).
ksi��ka(37, 'Gargantua i Pantagruel', autor(' Fran�ois Rabelais', 1494-
1553),wydanie('Siedmior�g',2004)).
ksi��ka(38, 'Gargantua i Pantagruel', autor(' Fran�ois Rabelais', 1805-
1880),wydanie('Siedmior�g2',2004)).
ksi��ka(38, 'XXX', autor(' KtosKtoZyje', 1980-
undefined),wydanie('Wydawnictwo XXX',2004)).

% Napisz klauzule kt�re wypisz�: 
% ksi��ki wydane po �mierci swojego autora
% R.U.R, Kobieta z wydm, Zamek, Gargantua i Pantagruel
afterDeath(X):-
	ksi��ka(_,X,autor(_,_-Z),wydanie(_,Rok)), Rok > Z.
 
istnieje(X):-
	ksi��ka(_,_,autor(X,_),_).
		
% autor�w, kt�rzy mieli szans� si� spotka� nie wiem jeszcze
% :-op(100,xfy,-).


spotkanie(X, Y):- 
	ksi��ka(_,_,autor(X,Y1-Y2),_), ksi��ka(_,_,autor(Y,Z1-_),_), Y1 < Z1, Z1 < Y2.
	
% list� wszystkich autor�w �yj�cych(nale�y zastosowa� predykaty agregacyjne)

% jak jest okreslone ze autor zyje? (DataUrodzenia-undefined)?
czy�yje(X):-
	ksi��ka(_,_,autor(X,_-undefined),_).

% Klauzula ktora znjaduje pare wydawnictw ktore wydaly ksiazke o tym samym tytule

% czzeemu nie dziala?!
tenSamTytul(X,Y):- 
	X\=Y, ksi��ka(_,Tytul1,_,wydanie(X,_)), ksi��ka(_,Tytul1,_,wydanie(Y,_)), write(Tytul1), nl.

	% a to dziala
tenSamTytul2(X,Y):-
	ksi��ka(_,Tytul1,_,wydanie(X,_)),
	ksi��ka(_,Tytul1,_,wydanie(Y,_)),
	X\=Y,
	write(Tytul1),nl.

% Wydawnictwo ktore wydalo ksiazke po smierci autora
wydaniePoSmierci(Tytul, Wydawnictwo):-
	ksi��ka(_,Tytul,autor(_,_-Death),wydanie(Wydawnictwo,Rok)), Rok > Death.

% lista wszystkich wydawnictw ktore wydaly przynajmniej jedna ksiazke napisana przez autora zyjacego
% w XIX Wieku zastosuj predykaty agregacyne
zXIXWieku(Wydawnictwo):-
	ksi��ka(_,_,autor(_,Od-Do),wydanie(Wydawnictwo,_)), Od > 1800, Do < 1901. 
	
kocha(marcellus, mia).
kocha(vincent,mia).
zazdrosny(X,Y) :-kocha(X,Z),!,kocha(Y,Z).

:- op(100,xfy, matka).
julia matka marcin.

:- op(300, xfx, ma).
:- op(200, xfy, i).
 
jas ma kota i psa.
ala ma jasia i angine i dosc_agh.
rybki i kanarki.

student(szymon, agh).
student(krzysiek, agh).
student(weronika, agh).
student(kasia, agh).
student(szymon, agh).
fajni_studenci :- student(X,agh),write(X), write(' '), fail, write(' nie jest fajny'),!.
fajni_studenci :- write('oni sa fajni').

:-op(80,xfy,jest).
sokrates jest czlowiek.

usunK(1,[_|T],T):-!.
usunK(K,[H|T],[H|TWithOutK]):-
	K1 is K - 1,
	usunK(K1,T,TWithOutK).

usun([],X,X).
usun([X|L1],L2,[X|L3]):-
		usun(L1,L2,L3).
		
wstaw(X,L,Du�a):-
	usun(X,Du�a,L).
	
nale�y3(X,L):-
	usun(_,[X|_],L).