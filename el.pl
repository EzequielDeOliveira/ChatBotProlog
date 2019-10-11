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


%% Padrões Pokemon - Geral
pattern([tell, me, about, X], [X,'-', N, '\n', 'type: ', Y, '\n', 'height: ', H, '\n', weight, W, '\n', 'evolution :', E , '\n', 'previous evolution: ', P]) 
:- pokemon(X, N), type(X, Y), height(X, H), weight(X, W), next_evolution(X, E), prev_evolution(X, P).

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
pattern([what,1,X,previous,evolutions],[X,previous,evolution,is,Elem,and,Elem2]) :- bagof(Y,prev_evolution(X,Y),Bag),length(Bag, 2),nth0(0,Bag,Elem),nth0(1,Bag,Elem2).

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