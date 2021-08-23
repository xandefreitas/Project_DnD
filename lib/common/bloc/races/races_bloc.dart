import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dd/common/api/races_webclient.dart';
import 'package:project_dd/model/races.dart';

import 'races_event.dart';
import 'races_state.dart';

class RacesBloc extends Bloc<RacesEvent, RacesState> {
  RacesBloc() : super(const RacesEmptyState());

  @override
  Stream<RacesState> mapEventToState(RacesEvent event) async* {
    Races races;

    try {
      if (event is RacesFetchEvent) {
        yield RacesFetchingState();
        races = await RacesWebClient().getRacesListPage();
        yield RacesFetchedState(races: races);
      }
    } catch (e) {
      yield RacesErrorState(cause: e.toString());
    }
  }
}
