import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

part 'poke_list_event.dart';
part 'poke_list_state.dart';

class PokeListBloc extends Bloc<PokeListEvent, PokeListState> {
  PokeListBloc() : super(PokeListInitial());

  @override
  Stream<PokeListState> mapEventToState(
    PokeListEvent event,
  ) async* {
    if (event is GetPokemonList) {
      try {
        yield PokeListInProgress();
        PokemonRepository pokemonRepository = PokemonRepository();
        List<Pokemon> listaPokes = await pokemonRepository.getListaPokemons();
        log(listaPokes.toString());
        yield PokeListSuccess(pokeList: listaPokes);
      } catch (error) {
        yield PokeListError();
        log(error.toString());
      }
    }
  }
}
