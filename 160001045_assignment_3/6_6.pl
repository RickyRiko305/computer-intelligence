other_bank(e,w).
other_bank(w,e).

move([X,X,Goat,Cabbage],wolf,[Y,Y,Goat,Cabbage]):- other_bank(X,Y).
move([X,Wolf,X,Cabbage],goat,[Y,Wolf,Y,Cabbage]):- other_bank(X,Y).
move([X,Wolf,Goat,X],cabbage,[Y,Wolf,Goat,Y]):- other_bank(X,Y).
move([X,Wolf,Goat,Cabbage],nothing,[Y,Wolf,Goat,Cabbage]):-other_bank(X,Y).

safety_check(X,X,_).
safety_check(X,_,X).

safe_status([Man,Wolf,Goat,Cabbage]):- 
	safety_check(Man,Goat,Wolf),
        safety_check(Man,Goat,Cabbage).

solution([e,e,e,e],[]).
solution(Config,[Move|OtherMoves]):- 
	move(Config,Move,NextConfig),
        safe_status(NextConfig),
	solution(NextConfig,OtherMoves).

%length(X,7), solution([w,w,w,w],X).