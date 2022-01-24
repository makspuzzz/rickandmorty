import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/character_cubit/cubit.dart';
import 'package:rickandmorty/services/reprository.dart';
import 'package:rickandmorty/widgets/character_widget/character_list_widget.dart';




class ListCharacters extends StatelessWidget {
  const ListCharacters({Key? key}) : super(key: key);
  Widget build(BuildContext context)  {
    final _characterRepository = CharacterRepository();
    return BlocProvider<CharacterCubit>(
        create: (context)=>CharacterCubit(characterRepository: _characterRepository),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("The Rick and Morty Characters"),
              backgroundColor: const Color.fromRGBO(36,41,47,1),
            ),
            backgroundColor: const Color.fromRGBO(34,39,45,1),
            body: CubistBufWidget()
        ));
    CharacterListWidget();
  }
}


class CubistBufWidget extends StatelessWidget {
  const CubistBufWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterCubit characterCubit = context.read<CharacterCubit>();
    characterCubit.get(0);
    return CharacterListWidget();
  }
}


