divide(X,Y) :- 0 is X mod Y.
divide(X,Y) :- X > Y+1, divide(X,Y+1).

prime(2) :- true,!.

prime(X) :- X > 2,\+(divide(X,2)).

solve(X,Y,L):- X>Y ,R is X-Y,prime(R),prime(Y),P=R, L = Y+P.
solve(X,Y,L):- Y-1>1, Y1 is Y-1,solve(X,Y1,L).
goto(X,L,P) :- X mod 2 =:= 0, X>3,Y is X-1, solve(X,Y,L).
goldbach(X,L):- P is X, goto(X,L,P).%, L=L+P.

%,P=L,R = (X-L), L=P+R