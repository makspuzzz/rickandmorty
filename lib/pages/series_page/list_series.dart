import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/series_cubit/series_cubit.dart';
import 'package:rickandmorty/services/series_services/series_reprository.dart';
import 'package:rickandmorty/widgets/series_widget/info_series.dart';




class ListSeries extends StatelessWidget {
  const ListSeries({Key? key}) : super(key: key);
  Widget build(BuildContext context)  {
    final _seriesRepository = SeriesRepository();
    return BlocProvider<SeriesCubit>(
        create: (context)=>SeriesCubit(seriesRepository: _seriesRepository),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("The Rick and Morty episodes"),
              backgroundColor: const Color.fromRGBO(36,41,47,1),
            ),
            backgroundColor: const Color.fromRGBO(34,39,45,1),
            body: const SeriesBufCubit()
        ));
  }
}


class SeriesBufCubit extends StatelessWidget {
  const SeriesBufCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SeriesCubit seriesCubit = context.read<SeriesCubit>();
    seriesCubit.get(0);
    return InfoSeriesWidget();
  }
}


