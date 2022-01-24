abstract class CharacterState{
}


class CharacterLoadingState extends CharacterState{

}

class CharacterLoadetState extends CharacterState{
  List<dynamic> loadetCharacter;
  CharacterLoadetState({required this.loadetCharacter});
}

class CharacterErorState extends CharacterState{
  CharacterErorState();
}