import 'package:flutter/material.dart';
import 'package:flutter_pokedex/model/pokedex_api.dart';
import 'package:flutter_pokedex/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    PokedexApi.getPokemonData();
    return const MaterialApp(title: 'Material App', home: HomePage());
  }
}
