import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/poke_list_bloc.dart';
import 'package:pokedex/widgets/poke_list_screen.dart';

void main() {
  runApp(Pokedex());
}

class Pokedex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokeListBloc>(
      lazy: false,
      create: (context) => PokeListBloc()..add(GetPokemonList()),
      child: MaterialApp(
        title: 'Pokédex',
        home: PokeListScreen(),
      ),
    );
  }
}
