female(mary).
female(sandra).
female(juliet).
female(lisa).
male(peter).
male(paul).
male(john).
male(bob).
male(harry).
parent(bob, lisa).
parent(bob, paul).
parent(bob, mary).
parent(juliet, lisa).
parent(juliet, paul).
parent(juliet, mary).
parent(peter, harry).
parent(lisa, harry).
parent(mary, john).
parent(mary, sandra).
father(X,Y):-
male(X),parent(X,Y),X\=Y.
sister(X,Y):-
female(X),(male(Y);female(Y)),parent(Z,X),parent(Z,Y),X\=Y.
grandmother(X,Y):-
parent(X,Z),parent(Z,Y),female(X).
brother(A,B):-
male(A),(male(B);female(B)),parent(Z,A),parent(Z,B),A\=B.
cousin(X,Y):-
parent(A,X),parent(B,Y),(brother(A,B);sister(A,B)).

