import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:pokedex/models/pokemon.dart';

String capitalize(String string) {
  return "${string[0].toUpperCase()}${string.substring(1)}";
}

Type parseTypes(String string) {
  switch (string) {
    case 'bug':
      return Type.bug;
    case 'dragon':
      return Type.dragon;
    case 'fairy':
      return Type.fairy;
    case 'fire':
      return Type.fire;
    case 'ghost':
      return Type.ghost;
    case 'ground':
      return Type.ground;
    case 'normal':
      return Type.normal;
    case 'psychic':
      return Type.psychic;
    case 'steel':
      return Type.steel;
    case 'dark':
      return Type.dark;
    case 'electric':
      return Type.electric;
    case 'fighter':
      return Type.fighter;
    case 'flying':
      return Type.flying;
    case 'grass':
      return Type.grass;
    case 'ice':
      return Type.ice;
    case 'poison':
      return Type.poison;
    case 'rock':
      return Type.rock;
    case 'water':
      return Type.water;
    default:
      return Type.normal;
  }
}

class PokemonRepository {
  Future<List<Pokemon>> getListaPokemons() async {
    final url = Uri.https('pokeapi.co', '/api/v2/pokemon');
    final response = await http.get(url);
    Map<String, dynamic> result = jsonDecode(response.body);
    final List<Pokemon> listaPokes = List.empty(growable: true);
    for (int i = 0; i < result['results'].length; i++) {
      // log(result['results'][i].toString());
      final pokeUrl = Uri.parse(result['results'][i]['url']);
      final pokeResponse = await http.get(pokeUrl);
      Map<String, dynamic> pokeDecoded = jsonDecode(pokeResponse.body);
      final List<Type> pokeTypes = (pokeDecoded['types'] as List).map((item) {
        return parseTypes(item['type']['name'].toString());
      }).toList();
      Pokemon pokemon = Pokemon(
        idPoke: pokeDecoded['id'].toString(),
        tipos: pokeTypes,
        nomePoke: capitalize(pokeDecoded['name']),
        linkImg: pokeDecoded['sprites']['front_default'],
      );
      log(pokemon.toString());
      listaPokes.add(pokemon);
    }
    return listaPokes;
  }

  Future<Pokemon> getPokemonById(String id) async {
    final url = Uri.https('pokeapi.co', '/api/v2/pokemon/$id');
    final response = await http.get(url);
    Map<String, dynamic> result = jsonDecode(response.body);
    log(result['types'].toString());
    final List<Type> pokeTypes = (result['types'] as List)
        .map((item) => parseTypes(item['type']['name'].toString()))
        .toList();
    log(pokeTypes.toString());
    Pokemon pokemon = Pokemon(
        idPoke: result['id'].toString(),
        linkImg: result['sprites']['front_default'],
        nomePoke: capitalize(result['name']),
        tipos: pokeTypes);
    return pokemon;
  }
}
