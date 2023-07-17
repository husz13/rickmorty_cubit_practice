import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rick_morty_characters_state.dart';

class RickMortyCharactersCubit extends Cubit<RickMortyCharactersState> {
  RickMortyCharactersCubit() : super(RickMortyCharactersInitial());
}
