import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:temis_front/model/atributes.dart';

import '../classesPage/classes_list_page.dart';

class AtributePage extends StatefulWidget {
  final dynamic atribute;

  AtributePage({this.atribute});

  @override
  _AtributePageState createState() => _AtributePageState();
}

class _AtributePageState extends State<AtributePage> {
  Atributes atributes;

  String text;
  List<dynamic> info = <dynamic>[];
  List<String> index = <String>[];
  List<dynamic> subList = <dynamic>[];
  List<dynamic> subList2 = <dynamic>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.atribute.name),
      ),
      body: atributeDetails(),
    );
  }

  atributeDetails() {
    info.clear();
    index.clear();
    for (int i = 0; i < 6; i++) {
      if (i < 6) {
        if (i == 0) {
          text = 'Index';
          index.add(text);
          info.add(atributes.index);
        } else if (i == 1) {
          text = 'Name';
          index.add(text);
          info.add(atributes.name);
        } else if (i == 2) {
          text = 'Full_Name';
          index.add(text);
          info.add(atributes.fullName);
        } else if (i == 3) {
          subList.clear();
          text = 'Description';
          index.add(text);
          for (int j = 0; j < atributes.description.length; j++) {
            subList.add(atributes.description[j]);
          }
          info.add(subList);
        } else if (i == 4) {
          subList2.clear();
          text = 'Skills';
          index.add(text);
          for (int j = 0; j < atributes.skills.length; j++) {
            subList2.add(atributes.skills[j].name);
          }
          info.add(subList2);
        } else if (i == 5) {
          text = 'URL';
          index.add(text);
          info.add(atributes.url);
        }
      }
    }
    return ListView.builder(
      itemCount: 6, //detailsData == null ? 0 : detailsData.length,
      itemBuilder: (context, i) {
        if (i == 3) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text(
                '${index[i]}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Column(
                children: [
                  Text(
                    '[1] ${subList[0]}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(
                    '[2] ${subList[1]}',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (i == 4) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text(
                ('${index[i]} [${subList2.length}]: '),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: mySkillList(),
            ),
          );
        } else {
          return Card(
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text(
                '${index[i]}',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                '${info[i]}',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blueGrey,
                ),
              ),
            ),
          );
        }
      },
    );
  }

  mySkillList() {
    return Container(
      height: 120,
      child: ListView.builder(
        itemCount: subList2.length,
        itemBuilder: (context, j) {
          return ListTile(
            title: Text(
              '${[j + 1]} ${subList2[j]}',
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey,
              ),
            ),
          );
        },
      ),
    );
  }
}
