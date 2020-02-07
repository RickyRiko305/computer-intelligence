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
male(X),parent(X,Y),(X\=Y).
sister(X,Y):-
female(X),parent(Z,Y),parent(Z,X),(X\=Y).
grandmother(X,Y):-
female(X),parent(X,Z),parent(Z,Y).

brother(X,Y):-
male(X),parent(Z,X),parent(Z,Y),(X\=Y).

grandparent(X,Y):-
parent(Z,X),parent(Z,Y),parent(R,Z).
cousin(X,Y):-
(parent(Z,X),parent(R,Y),(brother(Z,R);sister(Z,R)),(Z\=Y)).


