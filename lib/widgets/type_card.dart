import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';

class TypeCard extends StatelessWidget {
  final Type tipo;

  TypeCard({required this.tipo});

  @override
  Widget build(BuildContext context) {
    switch (tipo) {
      case Type.poison:
        return _MyCard('Poison', Color(0xffb97fc9));
      case Type.grass:
        return _MyCard('Grass', Colors.green.shade400);
      case Type.bug:
        return _MyCard('Bug', Color(0xff729f3f));
      case Type.dark:
        return _MyCard('Dark', Color(0xffa4a4a4));
      case Type.dragon:
        return _MyCard('Dragon', Color(0xff53a4cf));
      case Type.electric:
        return _MyCard('Electric', Color(0xffeed535));
      case Type.fairy:
        return _MyCard('Fairy', Color(0xfffdb9e9));
      case Type.fighter:
        return _MyCard('Fighter', Color(0xffd56723));
      case Type.fire:
        return _MyCard('Fire', Color(0xfffd7d24));
      case Type.flying:
        return _MyCard('Flying', Color(0xff3dc7ef));
      case Type.ghost:
        return _MyCard('Ghost', Color(0xff7b62a3));
      case Type.ground:
        return _MyCard('Ground', Color(0xffab9842));
      case Type.ice:
        return _MyCard('Ice', Color(0xff51c4e7));
      case Type.normal:
        return _MyCard('Normal', Color(0xffa4acaf));
      case Type.psychic:
        return _MyCard('Psychic', Color(0xfff366b9));
      case Type.rock:
        return _MyCard('Rock', Color(0xffa38c21));
      case Type.steel:
        return _MyCard('Steel', Color(0xff9eb7b8));
      case Type.water:
        return _MyCard('Water', Color(0xff4592c4));
      default:
        return Container();
    }
  }
}

class _MyCard extends StatelessWidget {
  final String txt;
  final Color color;

  _MyCard(this.txt, this.color);

  @override
  Widget build(BuildContext context) {
    return Card(
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(8.0),
      //     side: BorderSide(width: 0.5)),
      color: color,
      child: Container(
        alignment: Alignment.center,
        width: 56,
        height: 24,
        child: Text(txt),
      ),
    );
  }
}
