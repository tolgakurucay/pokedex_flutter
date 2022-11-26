import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/model/pokemon_model.dart';

class PokedexApi {
  static const String baseUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> getPokemonData() async {
    List<PokemonModel> _list = [];

    var result = await Dio().get(baseUrl);
    var pokeList = jsonDecode(result.data)['pokemon'];
    if (pokeList is List) {
      _list = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return [];
    }
    debugPrint(_list.length.toString());

    return _list;
  }
}
