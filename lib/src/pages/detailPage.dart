import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:temis_front/common/bloc/classes/classes_bloc.dart';
import 'package:temis_front/common/bloc/classes/classes_event.dart';
import 'package:temis_front/common/bloc/classes/classes_state.dart';
import 'package:temis_front/model/classes.dart';
import 'package:temis_front/model/details.dart';
import 'atributePage/atributePage.dart';
import 'classesList.dart';

// import 'package:dio/dio.dart';
// import 'package:temis_front/common/dio_singleton.dart';

class DetailPage extends StatefulWidget {
  final Results classes;

  DetailPage({this.classes});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  ClassesBloc classesBloc;

  @override
  void initState() {
    classesBloc = ClassesBloc()
      ..add(ClassInfoFetchEvent(classInfoName: widget.classes.name));
    super.initState();
  }

  @override
  Widget build(context) {
    return Container(
      color: Colors.white,
      child: BlocBuilder<ClassesBloc, ClassesState>(
        bloc: classesBloc,
        builder: (context, state) {
          if (state is ClassInfoFetchingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ClassInfoFetchedState) {
            Details detailsData = state.classInfo;
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.classes.name),
              ),
              body: ListView(
                children: [
                  Text(detailsData.index),
                  Text(detailsData.name),
                  Text(detailsData.hitDie.toString()),
                ],
              ),
            );
          }
          if (state is ClassesErrorState) {
            print('error');
          }
          return Container();
        },
      ),
    );
  }
}
