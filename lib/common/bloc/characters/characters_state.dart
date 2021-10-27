import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project_dd/model/character.dart';

import 'characters_event.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();

  @override
  List<Object> get props => [];
}

class CharactersEmptyState extends CharactersState {
  const CharactersEmptyState();
}

class CreatingCharacterState extends CharactersState {}

class CreatedCharacterState extends CharactersState {
  final String characterID;

  const CreatedCharacterState({@required this.characterID});

  @override
  List<Object> get props => [this.characterID];
}

class CharactersErrorState extends CharactersState {
  final dynamic exception;
  final CharactersEvent event;

  const CharactersErrorState({@required this.exception, @required this.event});

  @override
  List<Object> get props => [exception];
}

class CharactersInitState extends CharactersState {
  const CharactersInitState();
}
