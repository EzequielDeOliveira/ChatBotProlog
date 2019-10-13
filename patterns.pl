:-[pokelist].
:-[pokerules].
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

% Padrões do nome e número do pokemon
pattern([X,is,1,pokemon,'?'],[yes,X,is,a,'pokemon -',Y]) :- pokemon(X,Y).

%% Padrões do tipo do pokemon
% Quando o pokemon tem 1 tipo
pattern([what,X,type],[X,type,is,Elem]) :- getPokemonType(X,Elem).
%Quando o pokemon tem 2 tipos
pattern([what,X,type],[X,type,is,Elem,and,Elem2]) :- getPokemonType(X,Elem,Elem2).

%% Padrões da altura do pokemon
pattern([what,1,X,height,2],[X,height,is,Y]) :- height(X,Y).

%% Padrões de peso do pokemon
pattern([what,1,X,weight,2],[X,weight,is,Y]) :- weight(X,Y).
pattern([how,much,1,X,weights,2],[X,weight,is,Y]) :- weight(X,Y).

%%Padrões de evolução do pokemon
pattern([what,1,X,evolution],[X,evolution,is,Elem]) :- getPokemonEvolution(X,Elem).
pattern([what,1,X,evolutions],[X,evolution,are,Elem,and,Elem2]) :- getPokemonEvolution(X,Elem,Elem2).

%Padrões de desevolução do pokemon
pattern([what,1,X,previous,evolution],[X,previous,evolution,is,Elem]) :- getPokemonPreviousEvolution(X,Elem).
pattern([what,1,X,previous,evolutions],[X,previous,evolution,are,Elem,and,Elem2]) :- getPokemonPreviousEvolution(X,Elem,Elem2).

%Padrões de comparação de peso de 2 pokemons 
pattern([is,X,heavier,than,Y],[yes,X,is,heavier,than,Y]) :- isPokemonHeavier(X,Y).

pattern([is,X,heavier,than,Y],[no,X,is,lighter,than,Y]) :- isPokemonNotHeavier(X,Y).

pattern([is,X,heavier,than,Y],[X,'weight is equal to',Y]) :- isPokemonWeightEqual(X,Y).

%Padrões de comparação de altura de 2 pokemons 
pattern([is,X,higher,than,Y],[yes,X,is,higher,than,Y]) :- isPokemonHigher(X,Y).

pattern([is,X,higher,than,Y],[no,X,is,lower,than,Y]) :- isPokemonNotHigher(X,Y).

pattern([is,X,higher,than,Y],[X,'height is equal to',Y,height]) :- isPokemonHeightEqual(X,Y).

%Padrões de vantagem de pokemon com um tipo
pattern([1,2,X,has,advantage,over,T],[yes, X,'has advantage over',T]) :- advantage(X,T).

pattern([1,2,X,has,advantage,over,T],[no, X,'has disadvantage over',T]) :- disadvantage(X,T).


%Padrões de vantagem entre tipos
pattern([1,type,X,has,advantage,over,Y],[yes, X,'has advantage over',Y]) :- strong(X,Y).

pattern([1,type,X,has,advantage,over,Y],[no, X,'has disadvantage over',Y]) :- weak(X,Y).


%Padrões de listagem de fraquezas de um pokemon
pattern([what,are,X,weaknesses],FinalBag) :- getPokemonMultipleWeakness(X,FinalBag).

pattern([what,are,X,weaknesses],[X,weakness,are,Elem1,and,Elem2]) :- getPokemonWeakness(X,Elem1,Elem2).

pattern([what,are,X,weaknesses],[X,weakness,are,Elem1,',',Elem2,and,Elem3]) :- getPokemonWeakness(X,Elem1,Elem2,Elem3).

pattern([what,are,X,weaknesses],[X,weakness,are,Elem1,',',Elem2,',',Elem3,and,Elem4]) :- getPokemonWeakness(X,Elem1,Elem2,Elem3,Elem4).

pattern([what,are,X,weaknesses],[X,weakness,are,Elem1,',',Elem2,',',Elem3,',',Elem4,and,Elem5]) :- getPokemonWeakness(X,Elem1,Elem2,Elem3,Elem4,Elem5).

%Padrões de listagem de vantagens de um pokemon
pattern([what,is,X,strong,against],FinalBag) :- getPokemonMultipleStrongness(X,FinalBag).

pattern([what,is,X,strong,against],[X,'is strong against',Elem1,and,Elem2]) :- getPokemonStrongness(X,Elem1,Elem2).

pattern([what,is,X,strong,against],[X,'is strong against',Elem1,',',Elem2,and,Elem3]) :- getPokemonStrongness(X,Elem1,Elem2,Elem3).

pattern([what,is,X,strong,against],[X,'is strong against',Elem1,',',Elem2,',',Elem3,and,Elem4]) :- getPokemonStrongness(X,Elem1,Elem2,Elem3,Elem4).

pattern([what,is,X,strong,against],[X,'is strong against',Elem1,',',Elem2,',',Elem3,',',Elem4,and,Elem5]) :- getPokemonStrongness(X,Elem1,Elem2,Elem3,Elem4,Elem5).

%Padroes de listagem de imunidades de um pokemon
pattern([what,is,X,imunne,against],FinalBag) :- getPokemonMultipleImunnities(X,FinalBag).

pattern([what,is,X,imunne,against],[X,'is imunne against',Elem1]) :- getPokemonImunities(X,Elem1).

pattern([what,is,X,imunne,against],[X,'is imunne against',Elem1,and,Elem2]) :- getPokemonImunities(X,Elem1,Elem2).



pattern([1],['I dont think I understood that, you can ask me about pokemons names,types,advantages,evolution,height,weight...']).


