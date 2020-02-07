waterInJug(X,Y):-X>4,Y<3,
	write('4L jug overflowed'),nl.
waterInJug(X,Y):-X<4,Y>3,
	write('3L jug overflowed'),nl.
waterInJug(X,Y):-X>4 ,Y>3,
	write('Both overflowed'),nl.
waterInJug(X,Y):-
	(X=:=0,Y=:=0,nl,write('4L:0 3L:3(Action :Fill 3L jug)'),YY is 3,XX is 0,waterInJug(XX,YY));
                (X=:=0,Y=:=0,nl,write('4L:4 3L:0(Action :Fill 4L jug)'),YY is 0,XX is 4,waterInJug(XX,YY));
		(X=:=0,Y=:=1,nl,write('4L:4 3L:1(Action :Fill 4L jug)'),XX is 4,YY is 1,waterInJug(XX,YY));
                (X=:=0,Y=:=2,nl,write('4L:2 3L:0(Action :pour water from 3L to 4L jug)'),XX is 2,YY is 0,waterInJug(XX,YY));
		(X=:=0,Y=:=3,nl,write('4L:3 3L:0(Action :pour water from  3L to 4L jug)'),XX is 3,YY is 0,waterInJug(XX,YY));
		(X=:=1,Y=:=0,nl,write('4L:0 3L:1(Action :Fill from 4L to 3L jug)'),XX is 0,YY is 1,waterInJug(XX,YY));
		(X=:=1,Y=:=1,nl,write('4L:1 3L:3(Action :Fill  3L jug)'),XX is 1,YY is 3,waterInJug(XX,YY));
        	(X=:=1,Y=:=2,nl,write('4L:1 3L:3(Action :Fill  3L jug)'),XX is 1,YY is 3,waterInJug(XX,YY));
		(X=:=1,Y=:=3,nl,write('4L:1 3L:0(Action :Empty 3L jug)'),XX is 1,YY is 0,waterInJug(XX,YY));
		(X=:=2,Y=:=0,nl,write('Goal reached'));
		(X=:=2,Y=:=1,nl,write('4L:2 3L:0(Action :Empty  3L jug)'),XX is 2,YY is 0,waterInJug(XX,YY));
		(X=:=2,Y=:=2,nl,write('4L:2 3L:0(Action :Empty  3L jug)'),XX is 2,YY is 0,waterInJug(XX,YY));
		(X=:=2,Y=:=3,nl,write('4L:2 3L:0(Action :Empty 3L jug)'),XX is 2,YY is 0,waterInJug(XX,YY));
                
                
                
                (X=:=3,Y=:=0,nl,write('4L:3 3L:3(Action :Fill 3L jug)'),XX is 3,YY is 3,waterInJug(XX,YY));
                (X=:=3,Y=:=3,nl,write('4L:4 3L:2(Action :pour water from 3L to 4L jug)'),XX is 4,YY is 2,waterInJug(XX,YY));
                (X=:=4,Y=:=0,nl,write('4L:1 3L:3(Action :pour water from 4L to 3L jug)'),YY is 3,XX is 1,waterInJug(XX,YY));
                
                (X=:=4,Y=:=1,nl,write('4L:2 3L:3(Action :Fill 3L from 4L jug)'),XX is 2,YY is 3,waterInJug(XX,YY));
                
                (X=:=4,Y=:=2,nl,write('4L:0 3L:2(Action :Empty  4L jug)'),XX is 0,YY is 2,waterInJug(XX,YY)).
