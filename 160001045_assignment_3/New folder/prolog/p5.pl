creater(A,A,[X]):-X is A.
creater(A,B,[A|T]):- C is A+1,A=<B,creater(C,B,T).
