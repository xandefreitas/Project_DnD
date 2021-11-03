import 'package:equatable/equatable.dart';
import 'package:project_dd/model/auth.dart';
import 'package:project_dd/model/character.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class CharacterCreationEvent extends CharactersEvent {
  final Character character;
  final Auth token;

  const CharacterCreationEvent({this.character, this.token});

  @override
  List<Object> get props => [];
}

class CharacterUpdateEvent extends CharactersEvent {
  final Character character;
  final Auth token;

  const CharacterUpdateEvent({this.character, this.token});

  @override
  List<Object> get props => [];
}

class CharacterDeleteEvent extends CharactersEvent {
  final String characterID;
  final Auth token;

  const CharacterDeleteEvent({this.characterID, this.token});

  @override
  List<Object> get props => [];
}

class CharactersListFetchEvent extends CharactersEvent {
  final Auth token;
  const CharactersListFetchEvent(this.token);

  @override
  List<Object> get props => [];
}
