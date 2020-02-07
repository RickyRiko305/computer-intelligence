range(X,Y,[H]):- X =:= Y, H = Y.
range(X,Y,[H|T]):-H = X, X1 is X+1, range(X1,Y,T).