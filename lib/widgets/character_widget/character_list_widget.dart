import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/character_cubit/character_state.dart';
import 'package:rickandmorty/bloc/character_cubit/cubit.dart';
import 'package:rickandmorty/pages/characters_page/info_characters.dart';
import 'package:rickandmorty/styles/text_styles.dart';
import 'package:rickandmorty/widgets/Indicator.dart';
import 'package:rickandmorty/widgets/character_widget/card_character.dart';
import 'package:rickandmorty/widgets/error.dart';



class CharacterListWidget extends StatelessWidget {
  CharacterListWidget({
    Key? key,
  }) : super(key: key);
  @override
  int page = 1;

  Widget build(BuildContext context) {
    CharacterCubit characterCubit = context.read<CharacterCubit>();
    final ScrollController _controller = ScrollController();
    return BlocBuilder<CharacterCubit,CharacterState>(builder: (context,state){
      if(state is CharacterLoadetState) {
        return Column(
          children: [
            Expanded(
              child: NotificationListener<ScrollUpdateNotification>(
                onNotification: (notification){
                  if(notification.metrics.pixels ==
                      notification.metrics.maxScrollExtent){
                    page++;
                    characterCubit.getLoadCharacters(page,state.loadetCharacter);
                  }
                  return true;
                },
                child: ListView.builder(
                  itemExtent: 150,
                  controller: _controller,
                  scrollDirection: Axis.vertical,
                  itemCount: state.loadetCharacter.length,
                  itemBuilder: (context,index){
                    return CardCharacter(characters: state.loadetCharacter, index: index,);
                  },
                ),
              ),
            ),
          ],
        );
      }
      if(state is CharacterLoadingState){
        return const Center(child: IndicatorLoad());
      }
      if(state is CharacterErorState){
        CharacterCubit characterCubit = context.read<CharacterCubit>();
        return ErrorsWidget(cubit: characterCubit);
      }
      return Container();
    }

    );
  }
}









