import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/poke_list_bloc.dart';
import 'package:pokedex/widgets/poke_details_screen.dart';
import 'package:pokedex/widgets/pokemon_card.dart';

class PokeListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        title: Text('Pokédex'),
      ),
      body: BlocBuilder<PokeListBloc, PokeListState>(builder: (context, state) {
        if (state is PokeListSuccess) {
          return GridView.builder(
            itemCount: state.pokeList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              final poke = state.pokeList[index];
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  child: PokeCard(poke),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PokeDetailsScreen(poke.idPoke)));
                  },
                ),
              );
            },
            primary: false,
            padding: const EdgeInsets.all(8),
          );
        } else {
          return Container(
            child: Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            )),
          );
        }
      }),
    );
  }
}
