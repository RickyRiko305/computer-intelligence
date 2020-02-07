word(1):-write('one ').
word(2):-write('two ').
word(3):-write('three ').
word(4):-write('four ').
word(5):-write('five ').
word(6):-write('six ').
word(7):-write('seven ').
word(8):-write('eight ').
word(9):-write('nine ').
word(0):-write('zero ').
change(0):-!.
change(N):-N>0,P is N mod 10 , D is N // 10,change(D),word(P).
