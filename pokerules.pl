:- [pokelist].
:- [poketypes].

advantage(X,Y):-pokemon(X,_),type(X,Z),strong(Z,Y).

disadvantage(X,Y):-pokemon(X,_),type(X,Z),weak(Z,Y).

hasadvantage(X,Y):-type(X,Z),type(Y,W),strong(Z,W).