

import 'package:rickandmorty/models/series_models.dart';
import 'package:rickandmorty/services/series_services/series_services_provider.dart';

class SeriesRepository{
  final SeriesProvider _usersCharacter = SeriesProvider();
  Future<List<Series>>getAllSeries(List<dynamic> l)=> _usersCharacter.getProvider(l);
  Future<List<Series>>getPageSeries(int page)=> _usersCharacter.getPageProvider(page);
}
