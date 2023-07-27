import 'package:flutter/material.dart';
import '../../constants/colors.dart';

import '../../data/models/character_model/character_model.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.characterItem});
  final CharacterModel characterItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsetsDirectional.all(5),
      decoration: BoxDecoration(
        color: MyColors.myGreen,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        // ignore: sort_child_properties_last
        child: Container(
          color: MyColors.myBrown,
          child: characterItem.image!.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: "assets/images/loading2.gif",
                  image: characterItem.image!,
                  fit: BoxFit.cover,
                )
              : Image.asset("assets/images/hus.jpg"),
        ),
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text(
            characterItem.name!,
            style: const TextStyle(
                height: 1.3,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
