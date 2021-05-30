import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:temis_front/common/bloc/classes/classes_bloc.dart';
import 'package:temis_front/common/bloc/classes/classes_event.dart';
import 'package:temis_front/common/bloc/classes/classes_state.dart';
import 'package:temis_front/model/classes.dart';
import 'detailPage.dart';

class ClassesList extends StatefulWidget {
  @override
  _ClassesListState createState() => _ClassesListState();
}

class _ClassesListState extends State<ClassesList> {
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
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/sword.png',
          ),
        ),
        title: ListTile(
          title: Text(
            "Lista de Classes",
            textAlign: TextAlign.start,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          subtitle: Text(
            'https://www.dnd5eapi.co/api/classes',
            textAlign: TextAlign.start,
          ),
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
                  Icons.arrow_forward_ios,
                  size: 20,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(classes: classes[i]),
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
