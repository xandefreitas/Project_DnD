import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:temis_front/common/api/classes_webclient.dart';
import 'package:temis_front/model/classes.dart';
import 'package:temis_front/model/details.dart';

import 'classes_event.dart';
import 'classes_state.dart';

class ClassesBloc extends Bloc<ClassesEvent, ClassesState> {
  ClassesBloc() : super(const ClassesEmptyState());

  @override
  Stream<ClassesState> mapEventToState(ClassesEvent event) async* {
    Classes classes;
    Details classInfo;

    try {
      if (event is ClassesFetchEvent) {
        yield ClassesFetchingState();
        classes = await ClassesWebClient().getClassesListPage();
        yield ClassesFetchedState(classes: classes);
      }
      if (event is ClassInfoFetchEvent) {
        yield ClassInfoFetchingState();
        classInfo = await ClassesWebClient().getClassInfo(event.classInfoName);
        yield ClassInfoFetchedState(classInfo: classInfo);
      }
    } catch (e) {
      yield ClassesErrorState(cause: e.toString());
    }
  }
}
