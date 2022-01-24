import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/series_cubit/series_cubit.dart';
import 'package:rickandmorty/bloc/series_cubit/series_state.dart';
import 'package:rickandmorty/widgets/Indicator.dart';
import 'package:rickandmorty/widgets/series_widget/series_list.dart';
import 'package:rickandmorty/widgets/error.dart';

class InfoSeriesWidget extends StatelessWidget {
  InfoSeriesWidget({Key? key}) : super(key: key);

  @override
  int page = 1;

  Widget build(BuildContext context) {
    SeriesCubit seriesCubit = context.read<SeriesCubit>();
    final ScrollController _controller = ScrollController();
    return BlocBuilder<SeriesCubit,SeriesState>(builder: (context,state){
      if(state is SeriesLoadetState) {
        final listEpisodes = state.loadetSeries;
        //List<String> q = state.loadetSeries[0].characters;
        return Column(
          children: [
            Expanded(
              child: NotificationListener<ScrollUpdateNotification>(
                onNotification: (notification){
                  if(notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent){
                    page++;
                    seriesCubit.getLoadPage(page,state.loadetSeries);
                  }
                  return true;
                },
                child:ListView.builder(
                    itemCount: state.loadetSeries.length,
                    itemBuilder:(context,index){
                      return
                        SeriaWidget(listEpisodes: state.loadetSeries, index: index);
                    }
                ),
              ),
            )],
        );
      }
      if(state is SeriesLoadingState){
        return const Center(child: IndicatorLoad());
      }
      if(state is SeriesErorState){
        SeriesCubit characterCubit = context.read<SeriesCubit>();
        return ErrorsWidget(cubit: characterCubit);
        //Image.asset("assets/1.png", width: 320, height: 240);
      }
      return Container();
    }

    );
  }
}