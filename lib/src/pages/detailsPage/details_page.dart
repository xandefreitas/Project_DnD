import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:project_dd/common/bloc/classes/classes_bloc.dart';
import 'package:project_dd/common/bloc/classes/classes_event.dart';
import 'package:project_dd/common/bloc/classes/classes_state.dart';
import 'package:project_dd/core/app_colors.dart';
import 'package:project_dd/model/details.dart';
import 'package:project_dd/model/results.dart';
import 'package:unicons/unicons.dart';

import 'components/equipment_tab.dart';
import 'components/info_tab.dart';
import 'components/spellcasting_tab.dart';

class DetailsPage extends StatefulWidget {
  final Results classes;

  DetailsPage({this.classes});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  ClassesBloc classesBloc;

  @override
  void initState() {
    classesBloc = ClassesBloc()..add(ClassInfoFetchEvent(classInfoName: widget.classes.name));
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
            ClassDetails detailsData = state.classInfo;
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: PreferredSize(
                  child: AppBar(
                    backgroundColor: AppColors.purplePrimary,
                    leading: IconButton(
                      iconSize: 18,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 18,
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.white,
                    ),
                    title: Text(widget.classes.name),
                    centerTitle: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Center(
                        child: Image.asset(
                          'assets/images/classes/${widget.classes.name}.png',
                          scale: 0.7,
                        ),
                      ),
                      titlePadding: EdgeInsets.all(10),
                      centerTitle: true,
                    ),
                    bottom: TabBar(
                      indicatorColor: Colors.white,
                      unselectedLabelColor: Colors.deepPurple[300],
                      labelColor: Colors.white,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      tabs: [
                        Tab(
                          text: 'Info',
                          icon: Icon(
                            Icons.info,
                            size: 20,
                          ),
                        ),
                        Tab(
                          text: 'Equipment',
                          icon: Icon(
                            UniconsLine.backpack,
                            size: 20,
                          ),
                        ),
                        Tab(
                          text: 'Spellcasting',
                          icon: Icon(
                            LineIcons.magic,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  preferredSize: Size.fromHeight(200),
                ),
                body: TabBarView(
                  children: [
                    infoTab(context, detailsData),
                    equipmentTab(context, detailsData),
                    spellcastingTab(context, detailsData),
                  ],
                ),
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
