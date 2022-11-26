import 'package:flutter/material.dart';

import '../model/pokedex_api.dart';
import '../model/pokemon_model.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  late Future<List<PokemonModel>> _pokeList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pokeList = PokedexApi.getPokemonData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
      future: _pokeList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> _myList = snapshot.data!;
          return ListView.builder(
            itemCount: _myList.length,
            itemBuilder: (context, index) {
              var pokemonObject = _myList[index];
              return ListTile(
                title: Text(pokemonObject.name.toString()),
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("Error"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
