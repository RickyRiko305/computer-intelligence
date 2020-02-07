replace([],A,Z,[]):-!.
replace([H|T],A,B,[B|P]):-H=A,replace(T,A,B,P).
replace([H|T],A,B,[H|T1]):-replace(T,A,B,T1).