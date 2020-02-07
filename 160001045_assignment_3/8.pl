Int(0,L):- L is Zero,nl.
Int(1,L):- L is one,nl.
Int(2,L):- L is Two,nl.
Int(3,L):- L is Three,nl.
Int(4,L):- L is Four,nl.
Int(5,L):- L is Five,nl.
Int(6,L):- L is Six,nl.
Int(7,L):- L is Seven,nl.
Int(8,L):- L is Eight,nl.
Int(9,L):- L is Nine,nl.

printInt(0):- !.
printInt(X):- X1 = (X mod 10),X2=(X/10),printInt(X2),Int(X1,L),write(L).