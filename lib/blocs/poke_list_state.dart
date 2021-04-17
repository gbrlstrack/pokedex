part of 'poke_list_bloc.dart';

@immutable
abstract class PokeListState {}

class PokeListInitial extends PokeListState {}

class PokeListSuccess extends PokeListState {
  List<Pokemon> pokeList;

  PokeListSuccess({required this.pokeList});
}

class PokeListError extends PokeListState {}

class PokeListInProgress extends PokeListState {}
