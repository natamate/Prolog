sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
    sklej(L1,L2,L3).

dlugosc([],0).
dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
    Dlug is X+1.

    delLastThree(L,L1):-
      sklej(L1,[_,_,_],L).


    delFirstThree(L,L1):-
     sklej([_,_,_],L1,L).
      
    delThree(L,L2):-
      delFirstThree(L,L1),
      delLastThree(L1,L2).

    parzysta(L):-
      dlugosc(L,X), mod(X,2) =:= 0. 

    nieparzysta(L):-
      \+ parzysta(L).


    odwroc([],[]).
    odwroc([H|T],L) :-
		odwroc(T,R),
        sklej(R,[H],L).
    
    palindrom(L):-
       odwroc(L,L).

    przesun(L1,L2):-
      [H|T]=L1,
      sklej([_],L3,L1),
      sklej(L3,[H],L2).
	
	przesun2([],[]).	
	przesun2([H|T],L2):-
		sklej(T,[H],L2).
			
			
	znaczy(0,zero).   
	znaczy(1,jeden).
    znaczy(2,dwa).   
	znaczy(3,trzy).
    znaczy(4,cztery). 
	znaczy(5,piec).
    znaczy(6,szesc).  
	znaczy(7,siedem).
    znaczy(8,osiem).  
	znaczy(9,dziewiec).
	  
	przeloz([],[]).
	przeloz([X|XS],[Y|YS]) :-
		znaczy(X,Y),
		przeloz(XS,YS).
		
			
	isin([X|_], X).
	isin([_|T], Y) :-
		isin(T, Y).

	remove_first_X(X, [X|T], T).
	remove_first_X(X, [Y|T], [Y|Tn]) :-
		X \= Y,
		remove_first_X(X, T, Tn).

	podzbior_ver1(_, []).
	podzbior_ver1(X,[H|T]) :-
		isin(X, H),
		remove_first_X(H, X, N),
		podzbior_ver1(N,T).

		
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
	
	nalezy1(X,L) :-
		sklej(_,[X|_],L).	
	
	ostatni(Element,[Element]).	
	ostatni(Element,[_|T]):-
		ostatni(Element,T).
		
	%ostatni2(Element,[H|T]):-
		sklej(_,Element,T).