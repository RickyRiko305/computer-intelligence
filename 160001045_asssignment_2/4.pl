
do( state(middle, onbox, middle, hasnot),  
    grab,
    state(middle, onbox, middle, has) ). 

do( state(L, onfloor, L, Banana),         
    climb,
    state(L, onbox, L, Banana) ).

do( state(L1, onfloor, L1, Banana),       
    push(L1, L2),  
    state(L2, onfloor, L2, Banana) ).

do( state(L1, onfloor, Box, Banana),     
    walk(L1, L2),
    state(L2, onfloor, Box, Banana) ).


canget(state(_, _, _, has)).               

canget(State1) :-                         
      do(State1, Action, State2),          
      canget(State2).                    


canget(state(_, _, _, has), []).           

canget(State1, Plan) :-                  
      do(State1, Action, State2),         
      canget(State2, PartialPlan),       
      add(Action, PartialPlan, Plan).    

append(X,L,[X|L]).


