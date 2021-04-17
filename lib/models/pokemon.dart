enum Type {
  bug,
  dragon,
  fairy,
  fire,
  ghost,
  ground,
  normal,
  psychic,
  steel,
  dark,
  electric,
  fighter,
  flying,
  grass,
  ice,
  poison,
  rock,
  water,
}

class Pokemon {
  String nomePoke;
  String idPoke;
  String linkImg;
  List<Type> tipos;

  Pokemon({
    required this.nomePoke,
    required this.idPoke,
    required this.linkImg,
    required this.tipos,
  });

  @override
  String toString() {
    return 'Pokemon{nomePoke: $nomePoke, idPoke: $idPoke, linkImg: $linkImg, tipos: $tipos}';
  }
}
