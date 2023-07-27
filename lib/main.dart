import 'package:flutter/material.dart';

import 'router.dart';

void main() {
  runApp(RickMortyApp(route: ScreensRouter()));
}

class RickMortyApp extends StatelessWidget {
  final ScreensRouter route;

  const RickMortyApp({required this.route, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: route.generateRoute,
    );
  }
}
