import 'package:flutter/material.dart';

import '../../data/models/characters.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.characterItem});
  final Character characterItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(5),
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(characterItem.image))),
      child: Text("${characterItem.name}"),
    );
  }
}
