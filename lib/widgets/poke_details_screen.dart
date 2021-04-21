import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/blocs/poke_details/poke_details_bloc.dart';

class PokeDetailsScreen extends StatelessWidget {
  final String pokeId;

  PokeDetailsScreen(this.pokeId);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokeDetailsBloc>(
      create: (context) =>
          PokeDetailsBloc()..add(GetPokeById(pokeId: this.pokeId)),
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.red.shade400,
            title: Text('Pokédex'),
          ),
          body: BlocBuilder<PokeDetailsBloc, PokeDetailsState>(
            builder: (context, state) {
              if (state is PokeDetailsSuccess) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.pokemon.nomePoke,
                              style: TextStyle(fontSize: 24),
                            ),
                            Text(
                              ' #',
                              style: TextStyle(fontSize: 22),
                            ),
                            Text(
                              state.pokemon.idPoke,
                              style: TextStyle(fontSize: 24),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(state.pokemon.linkImg, scale: 0.4)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: IconButton(
                                  icon: Icon(Icons.list),
                                  onPressed: () => log('salve')),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: IconButton(
                                  icon: Icon(Icons.whatshot),
                                  onPressed: () => log('salve')),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                              child: IconButton(
                                  icon: Icon(Icons.bar_chart),
                                  onPressed: () => log('salve')),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                              child: IconButton(
                                  icon: Icon(Icons.timeline),
                                  onPressed: () => log('salve')),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              } else {
                return Container();
              }
            },
          )),
    );
  }
}
