import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/models/location_model.dart';

class LocationsProvider{
  Future<List<Locations>> getPageProvider(int page) async{
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/location/?page=$page'));
    if(response.statusCode ==200){
      final Map<String, dynamic> q = await json.decode(response.body);
      final List<dynamic> characterJson = q["results"];
      return characterJson.map((json) => Locations.fromJson(json)).toList();
    }else{
      throw Exception('eror');
    }
  }
}