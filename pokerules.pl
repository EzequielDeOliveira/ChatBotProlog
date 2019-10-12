:- [pokelist].
:- [poketypes].

advantage(X,Y):-pokemon(X,_),type(X,Z),strong(Z,Y).

disadvantage(X,Y):-pokemon(X,_),type(X,Z),weak(Z,Y).

hasadvantage(X,Y):-type(X,Z),type(Y,W),strong(Z,W).

getPokemonType(X,Elem) :- bagof(Y,type(X,Y),Bag),length(Bag, 1),nth0(0,Bag,Elem).

getPokemonType(X,Elem,Elem2) :- bagof(Y,type(X,Y),Bag),nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

getPokemonEvolution(X,Elem) :- bagof(Y,next_evolution(X,Y),Bag),length(Bag, 1),nth0(0,Bag,Elem).

getPokemonEvolution(X,Elem,Elem2) :- bagof(Y,next_evolution(X,Y),Bag),length(Bag, 2),nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

getPokemonPreviousEvolution(X,Elem) :- bagof(Y,prev_evolution(X,Y),Bag),length(Bag, 1),nth0(0,Bag,Elem).

getPokemonPreviousEvolution(X,Elem,Elem2) :- bagof(Y,prev_evolution(X,Y),Bag),length(Bag, 2),nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

isPokemonHeavier(X,Y) :- weight(X,PX), weight(Y,PY), atom_number(PX,PXINT), atom_number(PY,PYINT), PXINT > PYINT.

isPokemonNotHeavier(X,Y) :- weight(X,PX), weight(Y,PY), atom_number(PX,PXINT), atom_number(PY,PYINT), PXINT < PYINT.

isPokemonWeightEqual(X,Y) :- weight(X,PX), weight(Y,PY), atom_number(PX,PXINT), atom_number(PY,PYINT), PXINT = PYINT.

isPokemonHigher(X,Y) :- height(X,PX), height(Y,PY), atom_number(PX,PXINT), atom_number(PY,PYINT),PXINT > PYINT.

isPokemonNotHigher(X,Y) :- height(X,PX), height(Y,PY), atom_number(PX,PXINT), atom_number(PY,PYINT),PXINT < PYINT.

isPokemonHeightEqual(X,Y) :- height(X,PX), height(Y,PY), atom_number(PX,PXINT), atom_number(PY,PYINT),PXINT = PYINT.