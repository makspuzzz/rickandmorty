
import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/services/location_services/location_provider.dart';

class LocationsRepository{
  final LocationsProvider _usersCharacter = LocationsProvider();
  Future<List<Locations>>get(int page)=> _usersCharacter.getPageProvider(page);

}