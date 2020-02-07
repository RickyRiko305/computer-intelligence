replace([],L,X,[]):- !.
replace([H|T],L,X,[R|Q]):-  H=:=L,R=X,replace(T,L,X,Q).
replace([H|T],L,X,[H|Q]):- replace(T,L,X,Q).

%towardsdatascience,,,,,ricky kim