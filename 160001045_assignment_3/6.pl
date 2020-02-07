%bank(W,X,Y,Z) :- W==ee,X==ee,Y==ee,Z==ee,write('everyone is on the East Bank').
%bank(W,X,Y,Z) :- ((X==Y, W \= X); (Y==Z, W\=Y)),!.
%bank(W,X,Y,Z) :- ((W==e,((X==e,W1 is w,X1 is w,bank(W1,X1,Y,Z),write('farmer and wolf goto west Bank'));
%			 (Y==e,W1 is w,Y1 is w,bank(W1,X,Y1,Z),write('farmer and goat goto west Bank'));
%			 (z==e,W1 is w,z1 is w,bank(W1,X,Y,Z1),write('farmer and cabbage goto west Bank'))));
%		  (W==w,((X==w,W1 is e,X1 is ee,bank(W1,X1,Y,Z),write('farmer and wolf goto east Bank'));
%			 (Y==w,W1 is e,Y1 is ee,bank(W1,X,Y1,Z),write('farmer and goat goto east Bank'));
%			 (z==w,W1 is e,z1 is ee,bank(W1,X,Y,Z1),write('farmer and cabbage goto east Bank'))))).

opp(e, w).
opp(w, e).
%%move(state(X, X, G, C), state(Y, Y, G, C)) :- opp(X, Y).
%opp(e, w).
%opp(w, e).
move(state(F, W, G, C), state(Z, Z, G, C)) :- F = W, opp(F, Z).

unsafe(state(X, Y, Y, C)) :- opp(X, Y).
unsafe(state(X, W, Y, Y)) :- opp(X, Y).

move(state(X, X, G, C), state(Y, Y, G, C)) :-
opp(X, Y), \+(unsafe(state(Y, Y, G, C))).

move(state(X, X, G, C), state(Y, Y, G, C)) :- opp(X, Y), \+(unsafe(state(Y, Y, G, C))),writelist(['try farmer takes wolf', Y, Y, G, C]).
move(state(X, W, X, C), state(Y, W, Y, C)) :- opp(X, Y), \+(unsafe(state(Y, W, Y, C))),writelist(['try farmer takes goat', Y, W, Y, C]).
move(state(X, W, G, X), state(Y, W, G, Y)) :- opp(X, Y), \+(unsafe(state(Y, W, G, Y))),writelist(['try farmer takes cabbage', Y, W, G, Y]).

move(state(X, W, G, C), state(Y, W, G, C)) :- opp(X, Y), \+unsate(state(Y, W, G, C))),writelist(['try farmer takes self', Y, W, G, C]).
move(state(F, W, G, C), state(F, W, G, C)) :- writelist([' BACKTRACK from:', F, W, G, C]), fail.
path(Goal, Goal, Been_stack) :- write('Solution Path Is: ' ), nl,reverse_print_stack(Been_stack).
path(State, Goal, Been_stack) :- move(State, Next_state),\+(member_stack(Next_state, Been_stack)),stack(Next_state, Been_stack, New_been_stack),
                                 path(Next_state, Goal, New_been_stack), !.
opp(e, w).
opp(w, e).


go(Start, Goal) :-
empty_stack(Empty_been_stack),
stack(Start, Empty_been_stack, Been_stack),
path(Start, Goal, Been_stack).
test :- go(state(w,w,w,w), state(e,e,e,e)).