import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class ClassesEvent extends Equatable {
  const ClassesEvent();

  @override
  List<Object> get props => [];
}

class ClassesFetchEvent extends ClassesEvent {
  const ClassesFetchEvent();

  @override
  List<Object> get props => [];
}

class ClassInfoFetchEvent extends ClassesEvent {
  final String classInfoName;
  const ClassInfoFetchEvent({@required this.classInfoName});

  @override
  List<Object> get props => [];
}
