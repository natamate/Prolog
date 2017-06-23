mkrandom(X, 1, [Y]):- Y is random(X), !.
mkrandom(X, L, [R1|R]):- 
	R1 is random(X),
	L2 is L - 1,
	mkrandom(X,L2,R).