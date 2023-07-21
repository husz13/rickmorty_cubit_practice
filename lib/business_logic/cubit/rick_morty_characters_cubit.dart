import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:rickmorty_cubit_practice/data/repo/characters_repo.dart';
import '../../data/models/characters.dart';
part 'rick_morty_characters_state.dart';

class RickMortyCharactersCubit extends Cubit<RickMortyCharactersState> {
  RickMortyCharactersCubit(this.charactersrepo)
      : super(RickMortyCharactersInitial());
  final CharactersRepo charactersrepo;
  List<Character> characters = [];

  List<Character> getData() {
    charactersrepo.mapCharacters().then((characters) {
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
