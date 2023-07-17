import 'package:flutter/material.dart';
import 'package:rickmorty_cubit_practice/presentation/screens/character_details.dart';
import 'package:rickmorty_cubit_practice/presentation/screens/characters_screen.dart';

import 'constants/strings.dart';

class ScreensRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case allCharactersScreen:
        return MaterialPageRoute(builder: (_) => const CharactersScreen());
      case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) => const CharacterDetailsScreen());
      default:
        return null;
    }
  }
}
