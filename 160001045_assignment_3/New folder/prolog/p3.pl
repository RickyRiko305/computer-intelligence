remove_nth(H,[H|T],1,T).
remove_nth(X,[H|T],N,[H|R]):-D is N-1,remove_nth(X,T,D,R).