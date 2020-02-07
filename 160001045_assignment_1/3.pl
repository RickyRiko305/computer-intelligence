soldier(peckem,general).
soldier(cathcart,colonel).
soldier(moodus,colonel).
soldier(towser, sergeant).
soldier(knight, sergeant).
soldier(aardvark, captain).
soldier(dunbar, lieutenant).
soldier(flume, captain).
soldier(danby, major).
same_rank(X,Y):-
soldier(X,Z),soldier(Y,Z).