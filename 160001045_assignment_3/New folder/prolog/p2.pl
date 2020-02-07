fib(2,A):-A is 1.
fib(1,A):-A is 1.
fib(0,A):-A is 0.
fib(N,A):-X is N-1 , Y is N-2,((fib(X,Q),fib(Y,R)),A is (Q+R)).