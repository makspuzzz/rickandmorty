import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rickandmorty/models/series_models.dart';

class SeriesProvider{
  Future<List<Series>> getProvider(List<dynamic> episode) async{
    String geniralLink = "https://rickandmortyapi.com/api/episode/";
    for(int i = 0; i<episode.length;i++){
      final List l = episode[i].split('/');
      geniralLink = geniralLink+l[l.length-1]+',';
    }
    final response = await http.get(Uri.parse(geniralLink));
    if(response.statusCode ==200){
      final List<dynamic> seriesrJson = await json.decode(response.body);
      return seriesrJson.map((json) => Series.fromJson(json)).toList();
    }else{
      throw Exception('eror');
    }
  }
  Future<List<Series>> getPageProvider(int page) async{

    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/episode/?page=$page'));
    if(response.statusCode ==200){
      final Map<String, dynamic> q = await json.decode(response.body);
      final List<dynamic> characterJson = q["results"];
      return characterJson.map((json) => Series.fromJson(json)).toList();
    }else{
      throw Exception('eror');
     }
  }
}