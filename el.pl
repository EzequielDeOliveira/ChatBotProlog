:-[pokelist].

eliza :-
    write('? '), read_word_list(Input), eliza(Input), !.

eliza([bye]) :-
    write('Goodbye. I hope I have helped you'), nl.
eliza(Input) :-
    pattern(Stimulus, Response),
    match(Stimulus, Dictionary, Input),
    match(Response, Dictionary, Output),
    reply(Output),
    !, eliza.

match([N|Pattern], Dictionary, Target) :-
    integer(N), lookup(N, Dictionary, LeftTarget),
    append(LeftTarget, RightTarget, Target),
    match(Pattern, Dictionary, RightTarget).
match([Word | Pattern], Dictionary, [Word | Target]) :-
    atom(Word), match(Pattern, Dictionary, Target).
match([], _Dictionary, []).


tipos(X,Y) :- type(X,Y),tipos(X,Y).  

%pattern([1,you,2,me],[what,makes,you,think,i,2,you,'?']).

% Padrões do nome e número do pokemon
pattern([X,is,1,pokemon,'?'],[yes,X,is,a,pokemon,Y]) :- pokemon(X,Y).

% Padrões do tipo do pokemon
pattern([what,X,type],[X,type,is,Elem]) :- bagof(Y,type(X,Y),Bag),length(Bag, 1),nth0(0,Bag,Elem).


pattern([what,X,type],[X,type,is,Elem,and,Elem2]) :- bagof(Y,type(X,Y),Bag),nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

% Padrões Pokemon - Geral

pattern([tell, me, about, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'evolution :', E , '\n', 'previous evolution: ', P]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), next_evolution(X, E), prev_evolution(X, P).

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