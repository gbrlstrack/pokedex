part of 'poke_details_bloc.dart';

@immutable
abstract class PokeDetailsState {}

class PokeDetailsInitial extends PokeDetailsState {}

class PokeDetailsSuccess extends PokeDetailsState {
  final Pokemon pokemon;

  PokeDetailsSuccess({required this.pokemon});
}

class PokeDetailsErrored extends PokeDetailsState {}

class PokeDetailsInProgress extends PokeDetailsState {}
