import 'package:flutter/material.dart';
import 'package:rickmorty_cubit_practice/constants/colors.dart';
import 'package:rickmorty_cubit_practice/data/models/character_model/character_model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  const CharacterDetailsScreen({super.key, required this.selectedCharacter});
  final CharacterModel selectedCharacter;

  // List<String> indexOfEpisode() {
  //   final String Hello = "Hello There / sdfsdf/sdfsdf/sdfsdf/sdfsdf";
  //   final index = Hello.;
  //   H
  //   return index;
  // }
  List<String> getEpisodes(List<String> episodes) {
    List<String> epList;
    epList = episodes
        .map(
          (episodeUrl) => episodeUrl.substring(episodeUrl.lastIndexOf("/") + 1),
        )
        .toList();
    return epList;
  }

  Widget buildSliverAppBar() {
    return SliverAppBar(
      leading: const BackButton(color: Colors.black),
      stretch: true,
      //centerTitle: true,
      expandedHeight: 600,
      pinned: true,
      backgroundColor:
          const Color.fromARGB(255, 240, 229, 207), //rgb(240, 229, 207)
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          selectedCharacter.name!,
          style:
              const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        background: Hero(
          tag: selectedCharacter.id!,
          child: Image.network(
            selectedCharacter.image!,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterInfo(String title, String value) {
    return RichText(
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: const TextStyle(
                color: MyColors.myDark, //rgb(39, 55, 77)
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(
                color: Color.fromARGB(255, 203, 175, 135), //rgb(203, 175, 135)
                fontWeight: FontWeight.w600,
                fontSize: 17),
          )
        ],
      ),
    );
  }

  buildDivider(double length) {
    return Divider(
      thickness: 1.5,
      endIndent: length,
      color: MyColors.myBrown,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.myBackground,
      body: CustomScrollView(slivers: [
        buildSliverAppBar(),
        SliverList(
            delegate: SliverChildListDelegate([
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                characterInfo(
                    "Status:   ", selectedCharacter.status.toString()),
                buildDivider(270),
                const SizedBox(height: 5),
                characterInfo(
                    "Species:   ", selectedCharacter.species.toString()),
                buildDivider(250),
                const SizedBox(height: 5),
                characterInfo(
                    "Gender:   ", selectedCharacter.gender.toString()),
                buildDivider(260),
                const SizedBox(height: 5),
                characterInfo("Type:   ", selectedCharacter.type.toString()),
                buildDivider(280),
                const SizedBox(height: 5),
                characterInfo(
                    "Origin:   ", selectedCharacter.origin!.name.toString()),
                buildDivider(270),
                const SizedBox(height: 5),
                characterInfo("Location:   ",
                    selectedCharacter.location!.name.toString()),
                buildDivider(250),
                const SizedBox(height: 5),
                characterInfo("Episodes:   ",
                    getEpisodes(selectedCharacter.episode!).join(", ")),
                buildDivider(240),
                const SizedBox(height: 5),
              ],
            ),
          ),
          const SizedBox(height: 570)
        ]))
      ]),
    );
  }
}
