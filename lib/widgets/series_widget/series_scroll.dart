import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/character_cubit/character_state.dart';
import 'package:rickandmorty/bloc/character_cubit/cubit.dart';
import 'package:rickandmorty/styles/text_styles.dart';
import 'package:rickandmorty/widgets/Indicator.dart';
import 'package:rickandmorty/widgets/character_widget/card_character.dart';
import 'package:rickandmorty/widgets/character_widget/character_list_widget.dart';
import 'package:rickandmorty/widgets/error.dart';

class InfoBloc extends StatelessWidget {
  const InfoBloc({Key? key,required this.serie,required this.indexx}) : super(key: key);
  final List<dynamic> serie;
  final indexx;
  @override
  Widget build(BuildContext context) {
    CharacterCubit characterCubit = context.read<CharacterCubit>();
    characterCubit.getForSeries(serie[indexx].characters);
    return BlocBuilder<CharacterCubit,CharacterState>(builder: (context,state){
      if(state is CharacterLoadetState) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 15),
                    child: Text(serie[indexx].name,
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
                        const  Text("Air date:",
                          style: constTextListStyle,),
                        const SizedBox(height: 3,),
                        Text(serie[indexx].airDate,
                          style: infoTextListStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(height: 8,),
                        Text("Episode:",
                          style: constTextListStyle,),
                        const SizedBox(height: 3,),
                        Text(serie[indexx].episode,
                          style: infoTextListStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(
                          height: 25,
                        ),
                        const  Text("Characters:",
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
                  final listEpisodes = serie;
                  if(index<serie[indexx].characters.length){
                    return SizedBox(child: CardCharacter(index: index, characters: state.loadetCharacter,),
                      height: 150,);}
                },
              ),
            ),
          ],
        );
      };
      if(state is CharacterLoadingState){
        return const Center(child: IndicatorLoad());
      };
      if(state is CharacterState){
        CharacterCubit characterCubit = context.read<CharacterCubit>();
        return ErrorsWidget(cubit: characterCubit,);
      }
      return Container();
    });
  }
}