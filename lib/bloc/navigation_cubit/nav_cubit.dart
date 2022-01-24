
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/navigation_cubit/nav_states.dart';



class NavCubit extends  Cubit<NavState> {

  NavCubit(): super(NavCharacters());

  Future<void> characters() async {
    emit(NavCharacters());
  }
  Future<void> episodes() async {
    emit(NavSeries());
}
  Future<void> locations() async {
    emit(NavLocations());
  }
  }