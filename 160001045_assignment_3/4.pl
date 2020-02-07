%insert_at
insert_at(X,T,L,[K|T]):- L=:=1, K=X.
insert_at(X,[H|T],L,[H|Q]):- L1 is L-1, insert_at(X,T,L1,Q). 