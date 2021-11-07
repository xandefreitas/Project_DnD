import 'package:project_dd/model/auth.dart';
import 'package:project_dd/model/character.dart';

class CharacterDetailsArgs {
  final Function function;
  final Character character;
  final Auth auth;
  CharacterDetailsArgs(this.auth, this.character, this.function);
}
