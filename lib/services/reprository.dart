import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/provider.dart';


class CharacterRepository{
  final CharacterProvider _usersCharacter = CharacterProvider();
  Future<List<Character>>getAllCharacter(int page)=> _usersCharacter.getProvider(page);
  Future<List<Character>>getForCharacter(List<dynamic> l)=> _usersCharacter.getCharactersProvider(l);
}