import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_dd/common/bloc/races/races_bloc.dart';
import 'package:project_dd/common/bloc/races/races_event.dart';
import 'package:project_dd/common/bloc/races/races_state.dart';
import 'package:project_dd/model/results.dart';

class RacesListPage extends StatefulWidget {
  @override
  _RacesListPageState createState() => _RacesListPageState();
}

class _RacesListPageState extends State<RacesListPage> {
  RacesBloc racesBloc;

  @override
  void initState() {
    racesBloc = RacesBloc()..add(RacesFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4d3e7d),
        centerTitle: true,
        title: Text(
          "Races",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: classesList(),
    );
  }

  classesList() {
    return BlocBuilder<RacesBloc, RacesState>(
      bloc: racesBloc,
      builder: (context, state) {
        if (state is RacesFetchingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is RacesFetchedState) {
          List<Results> races = state.races.results;
          return ListView.builder(
            itemCount: races == null ? 0 : races.length,
            itemBuilder: (context, i) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  child: Image.asset(
                    'assets/images/${races[i].name}.png',
                    height: 40,
                  ),
                ),
                title: Text(
                  '${races[i].name}',
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
                      builder: (context) => null,
                    ),
                  );
                },
              );
            },
          );
        }
        if (state is RacesErrorState) {
          print('error');
        }

        return Container();
      },
    );
  }
}
