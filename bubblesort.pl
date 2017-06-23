gt(X,Y):- X > Y.
gt(X,Y):- X @> Y.

bubblesort(List, Sorted):-
	swap(List,List1), !,
	bubblesort(List1, Sorted).
	
% list is already sorted	
bubblesort(Sorted,Sorted).
	
% swap first two elements X > Y 
swap([X,Y|Rest],[Y,X|Rest]):- gt(X,Y).	

% swap elements in tail ]
swap([Z|Rest],[Z|Rest1]):-
	swap(Rest,Rest1).