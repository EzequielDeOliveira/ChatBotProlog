from pokedata import data

pokemons = data["pokemon"][0:2]

for pokemon in pokemons:
    print(f'% {pokemon["name"]}')
    print(f'pokemon({pokemon["name"]})')
    print()
    for poke_type in pokemon["type"]:
        print(f'type({pokemon["name"]}, {poke_type})')
    print()
    print(f'height({pokemon["name"]}, {pokemon["height"][0:-2]})')
    print(f'weight({pokemon["name"]}, {pokemon["weight"][0:-3]})')
    print()

    try:
        if "prev_evolution" in pokemon:
            for prev_evolution in pokemon["prev_evolution"]:
                print(
                    f'prev_evolution({pokemon["name"]}, {prev_evolution["name"]})')
        else:
            pass
    except:
        pass

    try:
        if "next_evolution" in pokemon:
            for next_evolution in pokemon["next_evolution"]:
                print(
                    f'next_evolution({pokemon["name"]}, {next_evolution["name"]})')
        else:
            pass
    except:
        pass

    print()

    print(f'image({pokemon["name"]}, {pokemon["img"]})')
    print()
