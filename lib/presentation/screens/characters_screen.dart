import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../../business_logic/cubit/rick_morty_characters_cubit.dart';
import '../../constants/colors.dart';
import '../../data/models/character_model/character_model.dart';
import '../widgets/grid_item.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  bool isSearching = false;
  final searchTextController = TextEditingController();
  late List<CharacterModel> searchedList = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<RickMortyCharactersCubit>(context).getData();
  }

  late List<CharacterModel> listOfAllCharacters;
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.grey),
          SizedBox(
            height: 20,
          ),
          Text("Loading...")
        ],
      ),
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
          mainAxisSpacing: 0),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: searchTextController.text.isEmpty
          ? listOfAllCharacters.length
          : searchedList.length,
      itemBuilder: (ctx, index) {
        return GridItem(
          characterItem: searchTextController.text.isEmpty
              ? listOfAllCharacters[index]
              : searchedList[index],
        );
      },
    );
  }

  AppBar normalAppBar() {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 192, 172, 133),
      leading: null,
      title: const Text(
        "Characters ",
      ),
      actions: [
        IconButton(
            onPressed: () {
              onSearch();
            },
            icon: const Icon(Icons.search))
      ],
    );
  }

  void onClearSearch() {
    setState(() {
      searchTextController.clear();
    });
  }

  void stopSearching() {
    onClearSearch();
    setState(() {
      isSearching = false;
    });
  }

  void onSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearching));

    setState(() {
      isSearching = true;
    });
  }

  void addItemToSearchedList(String searchedCharacter) {
    searchedList = listOfAllCharacters
        .where((character) => character.name!
            .toLowerCase()
            .startsWith(searchedCharacter.toLowerCase()))
        .toList();

    setState(() {});
  }

  AppBar searchAppBar() {
    return AppBar(
      backgroundColor: MyColors.myDarkGreen,
      leading: const BackButton(),
      title: TextField(
        onChanged: (searchedCharacter) {
          addItemToSearchedList(searchedCharacter);
        },
        autofocus: true,
        showCursor: true,
        cursorColor: Colors.white,
        controller: searchTextController,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: "Search For a Cahracter ...",
            helperStyle: TextStyle(fontSize: 16, color: Colors.grey)),
      ),
      actions: [
        IconButton(
            onPressed: () {
              if (searchTextController.text.isEmpty) {
                Navigator.pop(context);
              }
              onClearSearch();
            },
            icon: const Icon(Icons.cancel_outlined))
      ],
    );
  }

  Widget buildOfflineUI() {
    return Center(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset("assets/images/offline.png")
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearching ? searchAppBar() : normalAppBar(),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;

          if (connected) {
            return buildBlocWidget();
          } else {
            return buildOfflineUI();
          }
        },
        child: showLoadingIndicator(),
      ),
    );
  }
}
