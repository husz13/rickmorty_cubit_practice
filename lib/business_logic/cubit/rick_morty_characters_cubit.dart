import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:rickmorty_cubit_practice/data/models/character_model/character_model.dart';
import 'package:rickmorty_cubit_practice/data/repo/characters_repo.dart';

part 'rick_morty_characters_state.dart';

class RickMortyCharactersCubit extends Cubit<RickMortyCharactersState> {
  RickMortyCharactersCubit(this.charactersrepo)
      : super(RickMortyCharactersInitial());
  final CharactersRepo charactersrepo;
  List<CharacterModel> characters = [];

  List<CharacterModel> getData() {
    charactersrepo.mapCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
