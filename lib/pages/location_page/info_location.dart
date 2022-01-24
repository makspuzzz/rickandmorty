import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/character_cubit/character_state.dart';
import 'package:rickandmorty/bloc/character_cubit/cubit.dart';
import 'package:rickandmorty/services/reprository.dart';
import 'package:rickandmorty/widgets/location_widgets/location_scroll.dart';

class InfoLocationsPageWidget extends StatelessWidget {
  const InfoLocationsPageWidget({Key? key,required this.location,required this.index}) : super(key: key);
  final List<dynamic> location;
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
            body: InfoScrol(location: location, indexx: index,)
        )
    );
  }
}


