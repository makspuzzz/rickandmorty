abstract class SeriesState{
}

class SeriesLoadingState extends SeriesState{

}

class SeriesLoadetState extends SeriesState{
  List<dynamic> loadetSeries;
  SeriesLoadetState({required this.loadetSeries});
}

class SeriesErorState extends SeriesState{

}