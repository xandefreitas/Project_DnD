import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:project_dd/model/races.dart';

abstract class RacesState extends Equatable {
  const RacesState();

  @override
  List<Object> get props => [];
}

class RacesEmptyState extends RacesState {
  const RacesEmptyState();
}

class RacesFetchingState extends RacesState {}

class RacesFetchedState extends RacesState {
  final Races races;

  const RacesFetchedState({@required this.races});

  @override
  List<Object> get props => [this.races];
}

class RacesErrorState extends RacesState {
  final dynamic cause;

  const RacesErrorState({@required this.cause});

  @override
  List<Object> get props => [cause];
}
