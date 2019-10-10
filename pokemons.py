from pokedata import data

pokemons = data["pokemon"]
f = open('pokelist.pl','a')

for pokemon in pokemons:
    print(f'% {pokemon["name"]}',file=f)
    print(f'pokemon(\'{pokemon["name"]}\')',file=f)
    f.write('\n')
    for poke_type in pokemon["type"]:
        print(f'type(\'{pokemon["name"]}\', \'{poke_type}\')',file=f)
    f.write('\n')
    print(f'height(\'{pokemon["name"]}\', {pokemon["height"][0:-2]})',file=f)
    print(f'weight(\'{pokemon["name"]}\', {pokemon["weight"][0:-3]})',file=f)
    f.write('\n')

    try:
        if "prev_evolution" in pokemon:
            for prev_evolution in pokemon["prev_evolution"]:
                print(
                    f'prev_evolution(\'{pokemon["name"]}\', \'{prev_evolution["name"]}\')',file=f)
        else:
            pass
    except:
        pass

    try:
        if "next_evolution" in pokemon:
            for next_evolution in pokemon["next_evolution"]:
                print(
                    f'next_evolution(\'{pokemon["name"]}\', \'{next_evolution["name"]}\')',file=f)
        else:
            pass
    except:
        pass

    f.write('\n')

    print(f'image(\'{pokemon["name"]}\', {pokemon["img"]})',file=f)
    f.write('\n')

f.close()