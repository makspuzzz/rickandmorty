import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/models/characters_model.dart';


class CharacterProvider {
  Future<List<Character>> getProvider(int page) async {
    final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character/?page=$page'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> q = await json.decode(response.body);
      final List<dynamic> characterJson = q["results"];
      return characterJson.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('eror');
    }
  }

  Future<List<Character>> getCharactersProvider(List<dynamic> characters) async {
    String geniralLink = "https://rickandmortyapi.com/api/character/";
    for (int i = 0; i < characters.length; i++) {
      final List l = characters[i].split('/');
      geniralLink = geniralLink + l[l.length - 1] + ',';
    }
    final response = await http.get(Uri.parse(geniralLink));
    if (response.statusCode == 200) {
      final List<dynamic> characterJson = await json.decode(response.body);
      return characterJson.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('eror');
    }
  }
}