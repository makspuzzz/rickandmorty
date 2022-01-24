import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/character_cubit/cubit.dart';
import 'package:rickandmorty/services/reprository.dart';
import 'package:rickandmorty/widgets/series_widget/series_scroll.dart';


class InfoSeriesPageWidget extends StatelessWidget {
  const InfoSeriesPageWidget({Key? key,required this.serie,required this.index}) : super(key: key);
  final List<dynamic> serie;
  final index;
  @override
  Widget build(BuildContext context) {
    final _charactersRepository = CharacterRepository();
    return BlocProvider<CharacterCubit>(
        create: (context)=>CharacterCubit(characterRepository: _charactersRepository),
        child: Scaffold(
            appBar: AppBar(
              title: const Text("Episode details"),
              backgroundColor:const  Color.fromRGBO(36,41,47,1),
            ),
            backgroundColor:const  Color.fromRGBO(34,39,45,1),
            body: InfoBloc(serie: serie, indexx: index,)
        )
    );
  }
}


