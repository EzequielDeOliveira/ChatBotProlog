:-[pokelist].
:-[pokerules].
pokelog :-
    write('? '), read_word_list(Input), pokelog(Input), !.

pokelog([bye]) :-
    write('Goodbye. I hope I have helped you'), nl.
pokelog(Input) :-
    pattern(Stimulus, Response),
    match(Stimulus, Dictionary, Input),
    match(Response, Dictionary, Output),
    reply(Output),
    !, pokelog.

match([N|Pattern], Dictionary, Target) :-
    integer(N), lookup(N, Dictionary, LeftTarget),
    append(LeftTarget, RightTarget, Target),
    match(Pattern, Dictionary, RightTarget).
match([Word | Pattern], Dictionary, [Word | Target]) :-
    atom(Word), match(Pattern, Dictionary, Target).
match([], _Dictionary, []).


%% Padrões Pokemon - Geral
% Caso geral
pattern([tell, me, about, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'evolution :', E , '\n', 'previous evolution: ', P]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), next_evolution(X, E), prev_evolution(X, P).

pattern([X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'evolution :', E , '\n', 'previous evolution: ', P]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), next_evolution(X, E), prev_evolution(X, P).

pattern([who, is, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'evolution :', E , '\n', 'previous evolution: ', P]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), next_evolution(X, E), prev_evolution(X, P).

% Sem desevolução
pattern([tell, me, about, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'evolution :', E , '\n']) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(E, next_evolution(X, E), Bag), length(Bag, 1).

pattern([X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'evolution :', E , '\n']) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(E, next_evolution(X, E), Bag), length(Bag, 1).

pattern([who, is, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'evolution :', E , '\n']) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(E, next_evolution(X, E), Bag), length(Bag, 1).

% Sem evolução 
pattern([tell, me, about, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'previous evolution: ', P]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(P, prev_evolution(X, P), Bag), length(Bag, 1).

pattern([X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'previous evolution: ', P]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(P, prev_evolution(X, P), Bag), length(Bag, 1).

pattern([who, is, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'previous evolution: ', P]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(P, prev_evolution(X, P), Bag), length(Bag, 1).

% Com 2 desevoluções
pattern([tell, me, about, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'previous evolutions: ', Elem, and, Elem2]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(P, prev_evolution(X, P), Bag), nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

pattern([X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'previous evolutions: ', Elem, and, Elem2]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(P, prev_evolution(X, P), Bag), nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

pattern([who, is, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'previous evolutions: ', Elem, and, Elem2]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(P, prev_evolution(X, P), Bag), nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

% Com 2 evoluções
pattern([tell, me, about, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'Evolutions: ', Elem, and, Elem2]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(E, next_evolution(X, E), Bag), nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

pattern([X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'Evolutions: ', Elem, and, Elem2]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(E, next_evolution(X, E), Bag), nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

pattern([who, is, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'Evolutions: ', Elem, and, Elem2]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), bagof(E, next_evolution(X, E), Bag), nth0(0,Bag,Elem),nth0(1,Bag,Elem2).


%pattern([1,you,2,me],[what,makes,you,think,i,2,you,'?']).

% Padrões do nome e número do pokemon
pattern([X,is,1,pokemon,'?'],[yes,X,is,a,'pokemon -',Y]) :- pokemon(X,Y).

%% Padrões do tipo do pokemon
% Quando o pokemon tem 1 tipo
pattern([what,X,type],[X,type,is,Elem]) :- bagof(Y,type(X,Y),Bag),length(Bag, 1),nth0(0,Bag,Elem).
%Quando o pokemon tem 2 tipos
pattern([what,X,type],[X,type,is,Elem,and,Elem2]) :- bagof(Y,type(X,Y),Bag),nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

%% Padrões da altura do pokemon
pattern([what,1,X,height,2],[X,height,is,Y]) :- height(X,Y).

%% Padrões de peso do pokemon
pattern([what,1,X,weight,2],[X,weight,is,Y]) :- weight(X,Y).
pattern([how,much,1,X,weights,2],[X,weight,is,Y]) :- weight(X,Y).

%%Padrões de evolução do pokemon
pattern([what,1,X,evolution],[X,evolution,is,Elem]) :- bagof(Y,next_evolution(X,Y),Bag),length(Bag, 1),nth0(0,Bag,Elem).
pattern([what,1,X,evolutions],[X,evolution,is,Elem,and,Elem2]) :- bagof(Y,next_evolution(X,Y),Bag),length(Bag, 2),nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

%Padrões de desevolução do pokemon
pattern([what,1,X,previous,evolution],[X,previous,evolution,is,Elem]) :- bagof(Y,prev_evolution(X,Y),Bag),length(Bag, 1),nth0(0,Bag,Elem).
pattern([what,1,X,previous,evolutions],[X,previous,evolution,is,Elem,and,Elem2]) :- 
    bagof(Y,prev_evolution(X,Y),Bag),length(Bag, 2),nth0(0,Bag,Elem),nth0(1,Bag,Elem2).


%Padrões de comparação de peso de 2 pokemons 
pattern([is,X,heavier,than,Y],[yes,X,is,heavier,than,Y]) :- 
    weight(X,PX), weight(Y,PY), 
    atom_number(PX,PXINT), atom_number(PY,PYINT),
    PXINT > PYINT.

pattern([is,X,heavier,than,Y],[no,X,is,lighter,than,Y]) :- 
    weight(X,PX), weight(Y,PY), 
    atom_number(PX,PXINT), atom_number(PY,PYINT),
    PXINT < PYINT.

pattern([is,X,heavier,than,Y],[X,'weight is equal to',Y]) :- 
    weight(X,PX), weight(Y,PY), 
    atom_number(PX,PXINT), atom_number(PY,PYINT),
    PXINT = PYINT.

%Padrões de comparação de altura de 2 pokemons 
pattern([is,X,higher,than,Y],[yes,X,is,higher,than,Y]) :- 
    height(X,PX), height(Y,PY), 
    atom_number(PX,PXINT), atom_number(PY,PYINT),
    PXINT > PYINT.

pattern([is,X,higher,than,Y],[no,X,is,lower,than,Y]) :- 
    height(X,PX), height(Y,PY), 
    atom_number(PX,PXINT), atom_number(PY,PYINT),
    PXINT < PYINT.

pattern([is,X,higher,than,Y],[X,'height is equal to',Y,height]) :- 
    height(X,PX), height(Y,PY), 
    atom_number(PX,PXINT), atom_number(PY,PYINT),
    PXINT = PYINT.

%Padrões de vantagem de pokemon
pattern([1,2,X,has,advantage,over,T],[yes, X,'has advantage over',T]) :- advantage(X,T).

pattern([1,2,X,has,advantage,over,T],[no, X,'has disadvantage over',T]) :- disadvantage(X,T).


%Padrões de vantagem entre tipos
pattern([1,type,X,has,advantage,over,Y],[yes, X,'has advantage over',Y]) :- strong(X,Y).

pattern([1,type,X,has,advantage,over,Y],[no, X,'has disadvantage over',Y]) :- weak(X,Y).





pattern([1],[please,go,on]).



reply([Head | Tail]) :-
    write(Head), write(' '), reply(Tail).
reply([]) :- nl.

lookup(Key, [(Key, Value) | _Dict], Value).
lookup(Key, [(Key1, _Val1) | Dictionary], Value) :-
    Key \= Key1, lookup(Key, Dictionary, Value).

read_word_list(Ws) :-
    read_line_to_codes(user_input, Cs),
    atom_codes(A, Cs),
    tokenize_atom(A, Ws).