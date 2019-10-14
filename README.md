# O que é?
Pokelog é um chatbot que responde perguntas sobre pokemon, o tema das perguntas são o nome, número, tipo, peso, altura, proxima evolução, evolução anterior, vantagens do pokemon, desvantagens e imunidades. O programa busca simular uma conversa. O usuário escreve uma sentença e o bot dá uma resposta apropriada. O pokelog reconhece padrões entre as palavras e responde de acordo com a padrão de resposta correspondente.

O Pokelog é baseado na ELIZA, um clássico da inteligência artificial e o primeiro software para simulação de diálogos. Ela funciona com base no principio do procedimento é o match da entrada e um padrão. O resultado desse match é aplicado à outro padrão para determinar a resposta. O par de padrões pode ser considerado um par de estímulo/resposta, onde a entrada é comparada(matched) com o estímulo e a saída gerada da resposta. Um típico par estímulo/resposta é:
> - `Qual é a altura do {pokemon}     A altura do {pokemon} é X metros `

Usando esse par, a resposta do programa para a entrada  `Qual é a altura do pikachu`, vai ser  `A altura do {pokemon} é X metros `. O  `{pokemon}` pode ser visto como um slot a ser preenchido. O pokelog, sendo versão simplificada da ELIZA, implementa o seguinte algoritmo:
1. Lê o input
2. Enquanto o input não é  **`bye`**:
3. Escolhe um par estímulo/resposta,
4. Faz o match do input com o estímulo,
5. Gera a o output da resposta e o match acima,
6. Exibe a resposta,
7. Lê o próximo input.


# Sobre a base de conhecimento do Pokelog:

Os fatos disponíveis no arquivo **pokelist.py** são:
> - `pokemon(?Nome:string, ?Número:string)`
> - `type(?Nome:string, ?Número:string)`
> - `height(?Nome:string, ?Altura:string)`
> - `weight(?Nome:string, ?Peso:string)`
> - `next_evolution(?Nome:string, ?NomeProximaEvolucao:string)`
> - `prev_evolution(?Nome:string, ?NomeEvolucaoAnterior:string)`

Os fatos disponíveis no arquivo **poketypes.py** são:
> - `immune(?Tipo:string, ?Tipo:string)`
> - `weak(?Tipo:string, ?Tipo:string)`
> - `strong(?Tipo:string, ?Tipo:string)`

-------------

# Instalação e Execução

1. Instale o SWI-Prolog.
2. No diretório do projeto, execute **`swipl`** no terminal.
3. Execute **`[main].`** no terminal.
4. Execute **`pokelog.`** no terminal.
5. Converse com o pokelog!


# Perguntas que serão respondidas
As perguntas listadas a seguir contém apenas sentenças que o bot entenderá 

- who is **`nome do pokemon`**?
- **`nome do pokemon`**
- tell me about **`nome do pokemon`**
- is **`nome do pokemon`** a pokemon?
- what type is **`nome do pokemon`**?
- what is **`nome do pokemon`** height?
- what is **`nome do pokemon`** previous evolution?
- what is **`nome do pokemon`** previous evolutions?
- what is **`nome do pokemon`** evolution?
- what is **`nome do pokemon`** evolutions?
- is **`nome do pokemon`** havier than **`nome do pokemon`**?
- is **`nome do pokemon`** higher than **`nome do pokemon`**?
- **`nome do pokemon`** has advantage over **`nome do pokemon`**?
- type **`tipo do pokemon`** has advantage over **`tipo do pokemon`**?
- what are **`nome do pokemon`** weaknesses?
- what is  **`nome do pokemon`** strong against?
- what is  **`nome do pokemon`** imunne against?

-------

# Referências 

STERLING,  Leon. [The Art Of Prolog](https://www.amazon.com/Art-Prolog-Second-Programming-Techniques/dp/0262193388
): 2ª Edição. Cambridge: The MIT Press, 1999.


