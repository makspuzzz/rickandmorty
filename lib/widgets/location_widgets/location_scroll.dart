import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/character_cubit/character_state.dart';
import 'package:rickandmorty/bloc/character_cubit/cubit.dart';
import 'package:rickandmorty/styles/text_styles.dart';
import 'package:rickandmorty/widgets/Indicator.dart';
import 'package:rickandmorty/widgets/character_widget/card_character.dart';
import 'package:rickandmorty/widgets/character_widget/character_list_widget.dart';
import 'package:rickandmorty/widgets/error.dart';

class InfoScrol extends StatelessWidget {
  const InfoScrol({Key? key,required this.location,required this.indexx}) : super(key: key);
  final List<dynamic> location;
  final indexx;
  @override
  Widget build(BuildContext context) {
    CharacterCubit characterCubit = context.read<CharacterCubit>();
    characterCubit.getForSeries(location[indexx].residents);
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
                    child: Text(location[indexx].name,
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
                        const  Text("Dimension:",
                          style: constTextListStyle,),
                        const SizedBox(height: 3,),
                        Text(location[indexx].dimension,
                          style: infoTextListStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,),
                        const SizedBox(
                          height: 25,
                        ),
                        const  Text("Residents:",
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
                  final listEpisodes = location;
                  if(index<location[indexx].residents.length){
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
        CharacterCubit seriesCubit = context.read<CharacterCubit>();
        return ErrorsWidget(cubit: seriesCubit);
      }
      return Container();
    });
  }
}