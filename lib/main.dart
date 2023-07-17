import 'package:flutter/material.dart';
import 'package:rickmorty_cubit_practice/router.dart';

void main() {
  runApp(RickMortyApp(route: ScreensRouter()));
}

class RickMortyApp extends StatelessWidget {
  final ScreensRouter route;

  const RickMortyApp({required this.route, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: route.generateRoute,
    );
  }
}
