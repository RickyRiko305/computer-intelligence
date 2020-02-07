insert_at(H,1,[P|H],P).
insert_at([H|T],N,[H|R],P):-D is N-1,insert_at(T,D,R,P).