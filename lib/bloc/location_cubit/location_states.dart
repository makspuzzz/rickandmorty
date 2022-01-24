abstract class LocationsState{

}

class LocationsLoadingState extends LocationsState{

}

class LocationsLoadetState extends LocationsState{
  List<dynamic> loadetLocations;
  LocationsLoadetState({required this.loadetLocations});
}

class LocationsErorState extends LocationsState {

}
