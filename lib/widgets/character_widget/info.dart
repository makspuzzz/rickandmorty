import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/series_cubit/series_cubit.dart';
import 'package:rickandmorty/bloc/series_cubit/series_state.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/models/series_models.dart';
import 'package:rickandmorty/styles/text_styles.dart';
import 'package:rickandmorty/widgets/Indicator.dart';
import 'package:rickandmorty/widgets/series_widget/series_list.dart';
import 'package:rickandmorty/widgets/error.dart';

class InfoBloc extends StatelessWidget {
  const InfoBloc({Key? key,required this.characters}) : super(key: key);
  final Character characters;

  @override
  Widget build(BuildContext context) {
    SeriesCubit seriesCubit = context.read<SeriesCubit>();
    seriesCubit.getPage(characters.episode);
    return BlocBuilder<SeriesCubit,SeriesState>(builder: (context,state){
      if(state is SeriesLoadetState) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              // Put here all widgets that are not slivers.
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    characters.image,
                    width: double.infinity,
                    height: 270,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 15),
                    child: Text(characters.name,
                      style:const  TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 35,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50, top: 10),
                    child: Container(
                      height: 2,
                      decoration:const  BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Colors.white, Color.fromRGBO(34, 39, 45, 1)])
                      ),),
                  ),
                  Padding(padding:const  EdgeInsets.only(left: 25, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const  Text("Live status:",
                          style: constTextListStyle,),
                        const SizedBox(height: 3,),
                        Row(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: characters.status == "Alive"
                                      ? Colors.green
                                      : Colors.grey,
                                  borderRadius:const  BorderRadius.all(Radius.circular(100))
                              ),
                              width: 10,
                              height: 10,
                            ),
                            const SizedBox(width: 8,),
                            Text(characters.status,
                              style: infoTextListStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("Last known location:",
                          style: constTextListStyle,),
                        const SizedBox(height: 3,),
                        Text("${characters.species}(${characters.gender})",
                          style: infoTextListStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text("First seen in:",
                          style: constTextListStyle,),
                        const SizedBox(height: 3,),
                        Text("${state.loadetSeries[0].name}",
                          style: infoTextListStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(
                          height: 25,
                        ),
                        const  Text("Episodes:",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 27,
                          ),),
                      ],
                    ),
                  ),
                  //Expanded(child: SeriesListWidget(listEpisodes: state.loadetSeries as List<Series>,))
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final listEpisodes = state.loadetSeries as List<Series>;
                      if(index<listEpisodes.length){
                        return SeriaWidget(listEpisodes: listEpisodes, index: index,);}
                },
              ),
            ),
          ],
        );
      };
      if(state is SeriesLoadingState){
        return const Center(child: IndicatorLoad());
      };
      if(state is SeriesErorState){
        SeriesCubit seriesCubit = context.read<SeriesCubit>();
        return ErrorsWidget(cubit: seriesCubit);
      }
      return Container();
    });
  }
}

//