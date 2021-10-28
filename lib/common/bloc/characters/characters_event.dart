import 'package:equatable/equatable.dart';
import 'package:project_dd/model/character.dart';

abstract class CharactersEvent extends Equatable {
  const CharactersEvent();

  @override
  List<Object> get props => [];
}

class CharacterCreationEvent extends CharactersEvent {
  final Character character;

  const CharacterCreationEvent(this.character);

  @override
  List<Object> get props => [];
}

class CharacterUpdateEvent extends CharactersEvent {
  final Character character;

  const CharacterUpdateEvent(this.character);

  @override
  List<Object> get props => [];
}

class CharacterDeleteEvent extends CharactersEvent {
  final Character character;

  const CharacterDeleteEvent(this.character);

  @override
  List<Object> get props => [];
}

class CharacterListFetchEvent extends CharactersEvent {
  const CharacterListFetchEvent();

  @override
  List<Object> get props => [];
}
