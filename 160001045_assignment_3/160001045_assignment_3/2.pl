fib(0,X) :- X is 1.
fib(1,X) :- X is 1.
fib(N,X) :- N>1,R is N-1,Q is N-2, (fib(R,X1),fib(Q,X2)),X is (X1+X2).