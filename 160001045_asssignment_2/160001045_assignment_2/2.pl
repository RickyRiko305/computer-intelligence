lenght([],0).
lenght([_|T],L):- lenght(T,L1), L is L1+1.

appen([],L,L).
appen([H|T],L,[H|TL]) :- appen(T,L,TL).

head([H|_],H).
laST([L],L).
laST([_|T],L):- last(T,L).

reverser([],[]).
reverser([H|T],X):- reverse(T,Z), appen(Z,[H],X).

memBer(X,[X|_]).
memBer(X,[_|T]):- member(X,T).