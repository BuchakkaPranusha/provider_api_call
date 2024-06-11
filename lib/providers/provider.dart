import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pokeman/models/pokemon_model.dart';
import 'package:pokeman/services/services.dart';

class PokeManProvider extends ChangeNotifier {
  final _services = Services();
  bool isLoading = false;
  Map _pokemonDetails = {};
   get pokemonDetails => _pokemonDetails;

  List<Results> _results = [];
  List<Results> get results => _results;

  Future<void> getAllData() async{
    isLoading = true;
    notifyListeners();
    final response = await _services.getDataFromAPI();
    _results = response;
    isLoading = false;
    notifyListeners();
  }

  Future getSelectedPokemonData(pokemanName) async{
    isLoading = true;
    notifyListeners();

    final response = await _services.pokemonDetailsAPI(pokemanName);
    var temp = jsonDecode(response!.body);
    _pokemonDetails = temp as Map;
    print("response is...$_pokemonDetails");

    isLoading = false;
    notifyListeners();
  }

}