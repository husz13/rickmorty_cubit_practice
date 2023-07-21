part of 'rick_morty_characters_cubit.dart';

@immutable
abstract class RickMortyCharactersState {}

class RickMortyCharactersInitial extends RickMortyCharactersState {}

class CharactersLoaded extends RickMortyCharactersState {
  final List<Character> listOfCharacters;

  CharactersLoaded(this.listOfCharacters);
}
