import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/widgets/type_card.dart';

class PokeCard extends StatelessWidget {
  final Pokemon pokemon;

  PokeCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
          boxShadow: kElevationToShadow[4],
          color: Colors.white,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Image.network(pokemon.linkImg),
          Text(
            pokemon.nomePoke,
            style: TextStyle(fontSize: 24),
          ),
          Text(
            pokemon.idPoke,
            style: TextStyle(color: Colors.grey),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: pokemon.tipos.map((tipo) {
                return TypeCard(tipo: tipo);
              }).toList()),
        ],
      ),
    );
  }
}
