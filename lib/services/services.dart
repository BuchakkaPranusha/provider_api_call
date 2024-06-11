import 'dart:convert';

import 'package:http/http.dart';
import 'package:pokeman/models/pokemon_model.dart';
import 'package:http/http.dart' as http;


class Services{
  String url = 'https://pokeapi.co/api/v2/pokemon';

  // to fetch all list items
  Future<List<Results>> getDataFromAPI() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        var temp = json['results'] as List;
        final getAllList = temp.map((e){
          return Results(name: e['name'], url: e['url']);
        }).toList();
        print("pokemanList.....$getAllList");
        return getAllList;
      } else {
        return [];
      }
    } catch (e) {
       print("error...$e");
    }
    return [];
  }

// to fetch selected item details
  Future<Response?> pokemonDetailsAPI(pokemonName)async{
    try{
      var response = await http.get(Uri.parse(url +'/$pokemonName'));
      if(response.statusCode == 200){
        return response;
      }
    }catch(e){
      print("error...$e");
    }
    return null;
  }
}