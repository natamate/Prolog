%Napisz program obliczajacy rownanie kwadratowe

delta(A,B,C,Wynik):-
	Tmp is B*B - 4*A*C,
	Tmp > 0,
	Wynik = sqrt(Tmp).

kwadrat(A,B,C,Wynik):-
	delta(A,B,C,Tmp),
	Wynik is (-B+Tmp)/(2*A).  
	
kwadrat(A,B,C,Wynik):-
	delta(A,B,C,Tmp),
	Wynik is (-B-Tmp)/(2*A).  

factorial(0,1).
factorial(Number,Result):-
		Number > 0,
		NewNumber is Number - 1,
		factorial(NewNumber, NewResult),
		Result is Number*NewResult.
		

fib(0,1).
fib(1,1).
fib(Number,Result) :-
	Number > 0,
	NewNumber1 is (Number - 1),
	NewNumber2 is (Number - 2),
	fib(NewNumber1, Result1),
	fib(NewNumber2, Result2),
	Result is Result1 + Result2.

%on(X,Y) means that block X is directly on top of block Y.
on(b1,b2).   on(b3,b4).   on(b4,b5).   on(b5,b6).

%just left(X,Y) means that blocks X and Y are on the table
%and that X is immediately to the left of Y.
just_left(b2,b6).   just_left(b6,b7).

%above(X,Y) means that block X is somewhere above block Y 
%in the pile where Y occurs.
above(X,Y) :- on(X,Y).
above(X,Y) :- on(X,Z), above(Z,Y).

%left(X,Y) means that block X is somewhere to the left 
%of block Y but perhaps higher or lower than Y.
left(X,Y) :- just_left(X,Y).
left(X,Y) :- just_left(X,Z), left(Z,Y).
left(X,Y) :- on(X,Z), left(Z,Y).     % leftmost is on something.
left(X,Y) :- on(Y,Z), left(X,Z).     % rightmost is on something.

%right(X,Y) is the opposite of left(X,Y).
right(Y,X) :- left(X,Y).

left(a4,a5).
left(a3,a5).
left(a2,a5).
left(a1,a5).
left(a5,c2).
left(a5,c1).
left(c2,c4).
left(c2,c3).

allOnTheLeft(X,Y):-
	left(Y,X),write(Y),nl.
allOnTheLeft(X,Y):-
	left(Y,Z),left(Z,X),write(Z),nl.
	
%blocks_world

	
move(1,Left,Right,_) :-  
    write('Move top disk from '), 
    write(Left), 
    write(' to '), 
    write(Right), 
    nl. 
move(N,Left,Right,Center):- 
    N>1, 
    M is N-1, 
    move(M,Left,Center,Right), 
    move(1,Left,Right,_), 
    move(M,Center,Right,Left). 
	
