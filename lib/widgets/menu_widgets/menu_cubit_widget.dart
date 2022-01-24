import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/navigation_cubit/nav_cubit.dart';
import 'package:rickandmorty/bloc/navigation_cubit/nav_states.dart';
import 'package:rickandmorty/pages/characters_page/list_characters.dart';
import 'package:rickandmorty/pages/location_page/list_location.dart';
import 'package:rickandmorty/pages/series_page/list_series.dart';

class MenuCubit extends StatelessWidget {
  const MenuCubit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit,NavState>(builder: (context,state){
      if(state is NavCharacters){
        return const ListCharacters();
      }
      if(state is NavSeries){
        return const ListSeries();
      }
      if(state is NavLocations){
        return const ListLocation();
      }
      return Container();
    }

    );
  }
}