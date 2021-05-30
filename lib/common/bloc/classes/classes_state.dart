import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:temis_front/model/classes.dart';
import 'package:temis_front/model/details.dart';

abstract class ClassesState extends Equatable {
  const ClassesState();

  @override
  List<Object> get props => [];
}

class ClassesEmptyState extends ClassesState {
  const ClassesEmptyState();
}

class ClassesFetchingState extends ClassesState {}

class ClassInfoFetchingState extends ClassesState {}

class ClassInfoFetchedState extends ClassesState {
  final Details classInfo;

  const ClassInfoFetchedState({@required this.classInfo});

  @override
  List<Object> get props => [this.classInfo];
}

class ClassesFetchedState extends ClassesState {
  final Classes classes;

  const ClassesFetchedState({@required this.classes});

  @override
  List<Object> get props => [this.classes];
}

class ClassesErrorState extends ClassesState {
  final dynamic cause;

  const ClassesErrorState({@required this.cause});

  @override
  List<Object> get props => [cause];
}
