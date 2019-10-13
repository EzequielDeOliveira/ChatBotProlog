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

getPokemonWeakness(X,Elem,Elem2) :- getPokemonType(X,Z), bagof(Y,weak(Z,Y),Bag),length(Bag, 2),nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

getPokemonWeakness(X,Elem,Elem2,Elem3) :- getPokemonType(X,Z), bagof(Y,weak(Z,Y),Bag),length(Bag, 3),nth0(0,Bag,Elem),nth0(1,Bag,Elem2),nth0(2,Bag,Elem3).

getPokemonWeakness(X,Elem,Elem2,Elem3,Elem4) :- 
    getPokemonType(X,Z), bagof(Y,weak(Z,Y),Bag),length(Bag, 4),nth0(0,Bag,Elem),nth0(1,Bag,Elem2),nth0(2,Bag,Elem3),nth0(3,Bag,Elem4).

getPokemonWeakness(X,Elem,Elem2,Elem3,Elem4,Elem5) :- 
    getPokemonType(X,Z), bagof(Y,weak(Z,Y),Bag),length(Bag, 5),nth0(0,Bag,Elem),nth0(1,Bag,Elem2),nth0(2,Bag,Elem3),nth0(3,Bag,Elem4),nth0(4,Bag,Elem5).

getPokemonStrongness(X) :- getPokemonType(X,Z), bagof(Y,strong(Z,Y),Bag),length(Bag, 0).

getPokemonStrongness(X,Elem,Elem2) :- getPokemonType(X,Z), bagof(Y,strong(Z,Y),Bag),length(Bag, 2),nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

getPokemonStrongness(X,Elem,Elem2,Elem3) :- getPokemonType(X,Z), bagof(Y,strong(Z,Y),Bag),length(Bag, 3),nth0(0,Bag,Elem),nth0(1,Bag,Elem2),nth0(2,Bag,Elem3).

getPokemonStrongness(X,Elem,Elem2,Elem3,Elem4) :- 
    getPokemonType(X,Z), bagof(Y,strong(Z,Y),Bag),length(Bag, 4),nth0(0,Bag,Elem),nth0(1,Bag,Elem2),nth0(2,Bag,Elem3),nth0(3,Bag,Elem4).

getPokemonStrongness(X,Elem,Elem2,Elem3,Elem4,Elem5) :- 
    getPokemonType(X,Z), bagof(Y,strong(Z,Y),Bag),length(Bag, 5),nth0(0,Bag,Elem),nth0(1,Bag,Elem2),nth0(2,Bag,Elem3),nth0(3,Bag,Elem4),nth0(4,Bag,Elem5).

getPokemonImunities(X,Elem) :- getPokemonType(X,Z), bagof(Y,immune(Z,Y),Bag),length(Bag, 1),nth0(0,Bag,Elem).

getPokemonImunities(X,Elem,Elem2) :- getPokemonType(X,Z), bagof(Y,immune(Z,Y),Bag),length(Bag, 2),nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

getPokemonMultipleWeakness(X,FinalBag) :- getPokemonType(X,Z,W), bagof(Y,weak(Z,Y),Bag1),bagof(I,weak(W,I),Bag2),append(Bag1, Bag2, FinalBag).

getPokemonMultipleStrongness(X,FinalBag) :- getPokemonType(X,Z,W), bagof(Y,strong(Z,Y),Bag1),bagof(I,strong(W,I),Bag2),append(Bag1, Bag2, FinalBag).

getPokemonMultipleImunnities(X,FinalBag) :- getPokemonType(X,Z,W), bagof(Y,immune(Z,Y),Bag1),bagof(I,immune(W,I),Bag2),append(Bag1, Bag2, FinalBag).

