import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/series_cubit/series_state.dart';
import 'package:rickandmorty/models/series_models.dart';
import 'package:rickandmorty/services/series_services/series_reprository.dart';
class SeriesCubit extends  Cubit<SeriesState> {

  final SeriesRepository seriesRepository;

  SeriesCubit({required this.seriesRepository}) : super(SeriesLoadingState());

  Future<void> getPage(List<dynamic> l) async {
     try {
     emit(SeriesLoadingState());
    final List<Series> _loadingCharacters = await seriesRepository.getAllSeries(l);
    emit(SeriesLoadetState(loadetSeries: _loadingCharacters));
     } catch (_) {
    emit(SeriesErorState());
     }
  }
  Future<void> get(int page) async {
    try {
      emit(SeriesLoadingState());
      final List<Series> _loadingCharacters = await seriesRepository
          .getPageSeries(page);
      emit(SeriesLoadetState(loadetSeries: _loadingCharacters));
    } catch (e) {
      emit(SeriesErorState());
    }
  }
  Future<void> getLoadPage(int page, List<dynamic> oldList) async {
    try {
    final List<Series> _loadingCharacters = await seriesRepository
        .getPageSeries(page);
    var _newList = List.from(oldList)..addAll(_loadingCharacters);
    emit(SeriesLoadetState(loadetSeries: _newList));
    } catch (_) {
    }
  }
}
