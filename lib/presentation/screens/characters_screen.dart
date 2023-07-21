import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickmorty_cubit_practice/business_logic/cubit/rick_morty_characters_cubit.dart';
import 'package:rickmorty_cubit_practice/constants/colors.dart';
import 'package:rickmorty_cubit_practice/presentation/widgets/grid_item.dart';

import '../../data/models/characters.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  void initState() {
    super.initState();
    listOfAllCharacters =
        BlocProvider.of<RickMortyCharactersCubit>(context).getData();
  }

  late List<Character> listOfAllCharacters;
  Widget buildBlocWidget() {
    return BlocBuilder<RickMortyCharactersCubit, RickMortyCharactersState>(
      builder: (ctx, state) {
        if (state is CharactersLoaded) {
          listOfAllCharacters = state.listOfCharacters;
          return buildLoadedList();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: Colors.grey),
    );
  }

  Widget buildLoadedList() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myDarkGreen,
        child: Column(children: [buildGridView()]),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: listOfAllCharacters.length,
      itemBuilder: (ctx, index) {
        //TODO: not Done Yet
        return GridItem(
          characterItem: listOfAllCharacters[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Characters Of Rick And Morty")),
      body: buildBlocWidget(),
    );
  }
}
