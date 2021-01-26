import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:temis_front/model/details.dart';

import 'listView.dart';
import 'model/response.dart';

// import 'package:dio/dio.dart';
// import 'package:temis_front/common/dio_singleton.dart';

class DetailPage extends StatefulWidget {
  final dynamic classes;

  DetailPage({this.classes});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Details detailsData;
  ResponseA proficiencies;
  List<dynamic> info = <dynamic>[];
  List<String> index = <String>[];
  List<dynamic> subList = <dynamic>[];
  List<dynamic> subList2 = <dynamic>[];

  Future<Response> getDetails() async {
    final String url = '$baseUrl${widget.classes['url']}';
    return http.get(url);
  }

  Future<Response> getProficiencies() {
    final String url = '$baseUrl${widget.classes['url']}/proficiencies';
    return http.get(url);
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.classes['name']),
      ),
      body: FutureBuilder(
        future: getDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("data");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              detailsData = Details.fromJson(jsonDecode(snapshot.data.body));
              print(snapshot.data);
              return classDetails();
            } else {
              return Text('Nao ha dados');
            }
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget classDetails() {
    FutureBuilder(
      future: getProficiencies(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            proficiencies = ResponseA.fromJson(jsonDecode(snapshot.data.body));
          }
        }
        return Center(child: CircularProgressIndicator());
      },
    );

    //List<dynamic> subsubList = <dynamic>[];

    String text;
    for (int i = 0; i < 12; i++) {
      if (index.length < 12) {
        if (i == 0) {
          text = 'index';
          index.add(text);
          info.add(detailsData.index);
        } else if (i == 1) {
          text = 'name';
          index.add(text);
          info.add(detailsData.name);
        } else if (i == 2) {
          text = 'hit_die';
          index.add(text);
          info.add(detailsData.hitDie);
        } else if (i == 3) {
          text = 'proficiency_choices';
          index.add(text);
          for (int j = 0;
              j < detailsData.proficiencyChoices[0].from.length;
              j++) {
            subList2.add(detailsData.proficiencyChoices[0].from[j].name);
          }
          if (detailsData.proficiencyChoices.length == 2) {
            for (int j = 0;
                j < detailsData.proficiencyChoices[1].from.length;
                j++) {
              subList2.add(detailsData.proficiencyChoices[1].from[j].name);
            }
          }
          info.add(subList2);
        } else if (i == 4) {
          text = 'proficiencies';
          index.add(text);
          for (int j = 0; j < detailsData.proficiencies.length; j++) {
            subList.add(detailsData.proficiencies[j].name);
          }
          info.add(subList);
        } else if (i == 5) {
          text = 'saving_throws';
          index.add(text);
          info.add(detailsData.savingThrows);
        } else if (i == 6) {
          text = 'starting_equipment';
          index.add(text);
          info.add(detailsData.startingEquipment);
        } else if (i == 7) {
          text = 'class_levels';
          index.add(text);
          info.add(detailsData.classLevels);
        } else if (i == 8) {
          text = 'subclasses';
          index.add(text);
          info.add(detailsData.subclasses);
        } else if (i == 9) {
          text = 'spellcasting';
          index.add(text);
          info.add(detailsData.spellcasting);
        } else if (i == 10) {
          text = 'spells';
          index.add(text);
          info.add(detailsData.spells);
        } else if (i == 11) {
          text = 'url';
          index.add(text);
          info.add(detailsData.url);
        }
      }
    }
    return ListView.builder(
      itemCount: info.length, //detailsData == null ? 0 : detailsData.length,
      itemBuilder: (context, i) {
        if (i == 3) {
          return ListTile(
            leading: Icon(Icons.info),
            title: Text(
              ('${index[i]} [${subList2.length}]: '),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: proficiencyList(),
            trailing: Text(
              '(Choose: ${detailsData.proficiencyChoices[0].choose})',
              style: TextStyle(color: Colors.redAccent),
            ),
          );
        } else if (i == 4) {
          return ListTile(
            leading: Icon(Icons.info),
            title: Text(
              ('${index[i]} [${subList.length}]: '),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: classProficiencyList(),
          );
        } else {
          return ListTile(
            leading: Icon(Icons.info),
            title: Text(
              ('${index[i]}: '),
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            subtitle: Text('${info[i]}'),
          );
        }
      },
    );
  }

  classProficiencyList() {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: detailsData.proficiencies.length,
        itemBuilder: (context, j) {
          return ListTile(
            title: Text(
              '[${j + 1}] ${subList[j]}',
              style: TextStyle(fontSize: 15, color: Colors.blueGrey),
            ),
          );
        },
      ),
    );
  }

  proficiencyList() {
    return Container(
      height: 150,
      child: ListView.builder(
        itemCount: subList2.length,
        itemBuilder: (context, j) {
          return ListTile(
            title: Text(
              '[${j + 1}] ${subList2[j]}',
              style: TextStyle(fontSize: 15, color: Colors.blueGrey),
            ),
          );
        },
      ),
    );
  }
}



// subtitle: ListView.builder(
//             itemCount: 5,
//             itemBuilder: (context, j) {
//               return ListTile(
//                 title: Text('oi'),
//               );
//             },
//           ),
