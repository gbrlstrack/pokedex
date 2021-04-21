part of 'poke_details_bloc.dart';

@immutable
abstract class PokeDetailsEvent {}

class GetPokeById extends PokeDetailsEvent {
  final String pokeId;
  GetPokeById({required this.pokeId});
}
