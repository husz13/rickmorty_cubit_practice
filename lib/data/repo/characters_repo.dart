import 'package:rickmorty_cubit_practice/data/api/characters_api.dart';

import '../models/characters.dart';

class CharactersRepo {
  CharactersRepo(this.charApi);

  final CharactersApi charApi;
  Future<List<Character>> mapCharacters() async {
    final characters = await charApi.getAllCharacters();
    return characters["results"].map((character) {
      return Character.fromJson(character);
    }).toList();
  }
}
