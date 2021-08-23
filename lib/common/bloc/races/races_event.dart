import 'package:equatable/equatable.dart';

abstract class RacesEvent extends Equatable {
  const RacesEvent();

  @override
  List<Object> get props => [];
}

class RacesFetchEvent extends RacesEvent {
  const RacesFetchEvent();

  @override
  List<Object> get props => [];
}
