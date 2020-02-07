g([P],P).
firstelement([H|T],H,T).
n(1,[H|_],H):- !.
n(N,[_|T],X):- N1 is N-1, n(N1,T,X).