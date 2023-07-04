pokemon(bulbasur, hierba).
pokemon(squirtle, agua).
pokemon(charmander, fuego).

legendario(mew).
legendario(mewtwo).

superefectivo(agua,fuego).
superefectivo(fuego,hierba).
superefectivo(hierba,agua).

ganaEnBatalla(UnPokemon, OtroPokemon):-
        pokemon(UnPokemon,TipoGanador),
        pokemon(OtroPokemon, TipoPerdedor),
        superefectivo(TipoGanador, TipoPerdedor).