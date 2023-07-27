import '../api/characters_api.dart';
import '../models/character_model/character_model.dart';

class CharactersRepo {
  CharactersRepo(this.charApi);

  final CharactersApi charApi;
  Future<List<CharacterModel>> mapCharacters() async {
    final characters = await charApi.getAllCharacters();

    final model = (characters['results'] as List<dynamic>)
        .map((char) => CharacterModel.fromJson(char))
        .toList();
    return model;
  }
}
