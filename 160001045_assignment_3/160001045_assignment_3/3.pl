remove_at(X,[H|T],L,T):- L =:=1, X=H.
remove_at(X,[H|T],L,[H|Q]):- L1 is L-1, remove_at(X,T,L1,Q).