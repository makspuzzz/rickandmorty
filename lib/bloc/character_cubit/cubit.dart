


import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/bloc/character_cubit/character_state.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/reprository.dart';


class CharacterCubit extends  Cubit<CharacterState> {
  final CharacterRepository characterRepository;

  CharacterCubit({required this.characterRepository})
      : super(CharacterLoadingState());

  Future<void> get(int page) async {
    try {
      emit(CharacterLoadingState());
      final List<Character> _loadingCharacters = await characterRepository
          .getAllCharacter(page);
      emit(CharacterLoadetState(loadetCharacter: _loadingCharacters));
    } catch (e) {
      emit(CharacterErorState());
    }
  }

  Future<void> getLoadCharacters(int page, List<dynamic> oldList) async {
    try {
      final List<Character> _loadingCharacters = await characterRepository
          .getAllCharacter(page);
      var _newList = List.from(oldList)
        ..addAll(_loadingCharacters);
      emit(CharacterLoadetState(loadetCharacter: _newList));
    } catch (_) {}
  }

  Future<void> getForSeries(List<dynamic> l) async {
    try {

      emit(CharacterLoadingState());
      final List<Character> _loadingCharacters = await characterRepository
          .getForCharacter(l);

      emit(CharacterLoadetState(loadetCharacter: _loadingCharacters));
    } catch (_) {
      emit(CharacterErorState());
    }
  }
}
