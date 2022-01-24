import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/bloc/series_cubit/series_cubit.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/series_services/series_reprository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/widgets/character_widget/info.dart';



class InfoCharactersWidget extends StatelessWidget {
  final Character characters;
  const InfoCharactersWidget({Key? key,required this.characters}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _seriesRepository = SeriesRepository();
    return BlocProvider<SeriesCubit>(
        create: (context)=>SeriesCubit(seriesRepository: _seriesRepository),
        child: Scaffold(
      appBar: AppBar(
        title: const Text("Person details"),
        backgroundColor:const  Color.fromRGBO(36,41,47,1),
      ),
      backgroundColor:const  Color.fromRGBO(34,39,45,1),
      body: InfoBloc(characters: characters,)
    )
    );
  }
  }



