import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:temis_front/common/bloc/classes/classes_bloc.dart';
import 'package:temis_front/common/bloc/classes/classes_event.dart';
import 'package:temis_front/common/bloc/classes/classes_state.dart';
import 'package:temis_front/model/classes.dart';
import 'package:temis_front/model/details.dart';
import 'package:unicons/unicons.dart';

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
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: PreferredSize(
                  child: AppBar(
                    backgroundColor: Colors.purple[900],
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
                          'assets/images/${widget.classes.name}.png',
                          scale: 0.7,
                        ),
                      ),
                      titlePadding: EdgeInsets.all(10),
                      centerTitle: true,
                    ),
                    bottom: TabBar(
                      indicatorColor: Colors.deepPurple[300],
                      unselectedLabelColor: Colors.white,
                      labelColor: Colors.deepPurple[300],
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
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.purple[900],
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Proficiencies:',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: detailsData.proficiencies
                                        .map((e) => Text(' - ${e.name}'))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.purple[900],
                                    width: 2,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Subclasses:',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: detailsData.subclasses
                                              .map((e) => Text(' - ${e.name}'))
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      LineIcons.angleRight,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(16),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.purple[900],
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Starting Equipment:',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: detailsData
                                            .startingEquipment.isEmpty
                                        ? [
                                            Text(
                                                'This class does not have starting equipment')
                                          ]
                                        : detailsData.startingEquipment
                                            .map((e) => Text(
                                                '${e.quantity}x - ${e.equipment.name}'))
                                            .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.purple[900],
                                    width: 2,
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    detailsData.name == 'Barbarian' ||
                                            detailsData.name == 'Fighter' ||
                                            detailsData.name == 'Monk' ||
                                            detailsData.name == 'Rogue'
                                        ? Text(
                                            'Spellcasting:',
                                            style: TextStyle(fontSize: 18),
                                          )
                                        : Text(
                                            'Spellcasting (${detailsData.spellcasting.spellcastingAbility.name}):',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: detailsData.name ==
                                                  'Barbarian' ||
                                              detailsData.name == 'Fighter' ||
                                              detailsData.name == 'Monk' ||
                                              detailsData.name == 'Rogue'
                                          ? [
                                              Text(
                                                  'This class does not have magic')
                                            ]
                                          : detailsData.spellcasting.info
                                              .map((e) => ListTile(
                                                    title: Text(' - ${e.name}'),
                                                    subtitle: Column(
                                                      children: e.desc
                                                          .map((e) =>
                                                              Text('$e\n'))
                                                          .toList(),
                                                    ),
                                                  ))
                                              .toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
