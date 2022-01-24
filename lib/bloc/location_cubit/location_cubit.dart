import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/location_cubit/location_states.dart';
import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/services/location_services/location_reprository.dart';

class LocationsCubit extends  Cubit<LocationsState> {

  final LocationsRepository locationRepository;

  LocationsCubit({required this.locationRepository}) : super(LocationsLoadingState());

  Future<void> get(int page) async {
      try {
    emit(LocationsLoadingState());
    final List<Locations> _loadingLocation = await locationRepository.get(page);
    emit(LocationsLoadetState(loadetLocations: _loadingLocation));
      } catch (e) {
      emit(LocationsErorState());
      }
  }
  Future<void> getLoadPage(int page, List<dynamic> oldList) async {
     try {
    final List<Locations> _loadingCharacters = await locationRepository
        .get(page);
    var _newList = List.from(oldList)..addAll(_loadingCharacters);
    emit(LocationsLoadetState(loadetLocations: _newList));
     } catch (_) {
     }
  }
}