import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:temis_front/common/bloc/classes/classes_bloc.dart';
import 'package:temis_front/common/bloc/classes/classes_event.dart';
import 'package:temis_front/common/bloc/classes/classes_state.dart';
import 'package:temis_front/model/classes.dart';
import '../detailsPage/details_page.dart';

class ClassesListPage extends StatefulWidget {
  @override
  _ClassesListPageState createState() => _ClassesListPageState();
}

class _ClassesListPageState extends State<ClassesListPage> {
  ClassesBloc classesBloc;

  @override
  void initState() {
    classesBloc = ClassesBloc()..add(ClassesFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4d3e7d),
        centerTitle: true,
        title: Text(
          "Classes",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: classesList(),
    );
  }

  classesList() {
    return BlocBuilder<ClassesBloc, ClassesState>(
      bloc: classesBloc,
      builder: (context, state) {
        if (state is ClassesFetchingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ClassesFetchedState) {
          List<Results> classes = state.classes.results;
          return ListView.builder(
            itemCount: classes == null ? 0 : classes.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/images/${classes[i].name}.png',
                    height: 40,
                  ),
                ),
                title: Text(
                  '${classes[i].name}',
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                trailing: Icon(
                  LineIcons.angleRight,
                  size: 20,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsPage(classes: classes[i]),
                    ),
                  );
                },
              );
            },
          );
        }
        if (state is ClassesErrorState) {
          print('error');
        }

        return Container();
      },
    );
  }
}
