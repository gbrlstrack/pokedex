import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/repositories/pokemon_repository.dart';

part 'poke_details_event.dart';
part 'poke_details_state.dart';

class PokeDetailsBloc extends Bloc<PokeDetailsEvent, PokeDetailsState> {
  PokeDetailsBloc() : super(PokeDetailsInitial());

  @override
  Stream<PokeDetailsState> mapEventToState(
    PokeDetailsEvent event,
  ) async* {
    if (event is GetPokeById) {
      try {
        yield PokeDetailsInProgress();
        PokemonRepository repository = PokemonRepository();
        Pokemon pokemon = await repository.getPokemonById(event.pokeId);
        yield PokeDetailsSuccess(pokemon: pokemon);
      } catch (error) {
        yield PokeDetailsErrored();
        log(error.toString());
      }
    }
  }
}
