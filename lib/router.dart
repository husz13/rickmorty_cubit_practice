import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty_cubit_practice/data/models/character_model/character_model.dart';
import 'business_logic/cubit/rick_morty_characters_cubit.dart';
import 'data/api/characters_api.dart';
import 'data/repo/characters_repo.dart';
import 'presentation/screens/character_details.dart';
import 'presentation/screens/characters_screen.dart';

import 'constants/strings.dart';

class ScreensRouter {
  late final CharactersRepo charactersRepo;
  late final RickMortyCharactersCubit charactersCubit;
  ScreensRouter() {
    charactersRepo = CharactersRepo(CharactersApi());

    charactersCubit = RickMortyCharactersCubit(charactersRepo);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allCharactersScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext ctx) => charactersCubit,
            child: const CharactersScreen(),
          ),
        );
      case characterDetailsScreen:
        final selectedCharacter = settings.arguments as CharacterModel;
        return MaterialPageRoute(
            builder: (_) => CharacterDetailsScreen(
                  selectedCharacter: selectedCharacter,
                ));
      default:
        return null;
    }
  }
}
