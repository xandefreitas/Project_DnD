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
  dynamic detailsData;
  ResponseA proficiencies;

  Future<String> getDetails() async {
    final String url = '$baseUrl${widget.classes['url']}';
    var response = await http.get(url);
    setState(() {
      detailsData = json.decode(response.body);
    });

    print(detailsData);

    return "Dados obtidos com sucesso";
  }

  Future<String> getProficiencies() async {
    final String url = '$baseUrl${widget.classes['url']}/proficiencies';
    var response = await http.get(url);
    setState(() {
      proficiencies = json.decode(response.body);
    });

    print(proficiencies);

    return "Dados obtidos com sucesso";
  }

  Future<Response> getProficiencies2() {
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
        future: getProficiencies2(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("data");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              proficiencies = ResponseA.fromJson(snapshot.data.body);
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

  @override
  void initState() {
    super.initState();
    this.getDetails();
    //this.getProficiencies();
  }

  Widget classDetails() {
    List<dynamic> info = <dynamic>[];
    List<String> index = <String>[];
    List<dynamic> subList = <dynamic>[];
    //List<dynamic> subsubList = <dynamic>[];

    String text;
    for (int i = 0; i < detailsData.length; i++) {
      if (detailsData.length == 12) {
        if (i == 0) {
          text = 'index';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 1) {
          text = 'name';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 2) {
          text = 'hit_die';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 3) {
          text = 'proficiency_choices';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 4) {
          text = 'proficiencies';
          index.add(text);
          // for (int j = 0; j < proficiencies['count']; j++) {
          //   subList.add(proficiencies['results']);
          // }
          info.add(subList);
        } else if (i == 5) {
          text = 'saving_throws';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 6) {
          text = 'starting_equipment';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 7) {
          text = 'class_levels';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 8) {
          text = 'subclasses';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 9) {
          text = 'spellcasting';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 10) {
          text = 'spells';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 11) {
          text = 'url';
          index.add(text);
          info.add(detailsData[text]);
        }
      } else {
        if (i == 0) {
          text = 'index';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 1) {
          text = 'name';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 2) {
          text = 'hit_die';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 3) {
          text = 'proficiency_choices';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 4) {
          text = 'proficiencies';
          index.add(text);
          // for (int j = 0; j < proficiencies['count']; j++) {
          //   subList.add(proficiencies['results']);
          // }
          info.add(subList);
        } else if (i == 5) {
          text = 'saving_throws';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 6) {
          text = 'starting_equipment';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 7) {
          text = 'class_levels';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 8) {
          text = 'subclasses';
          index.add(text);
          info.add(detailsData[text]);
        } else if (i == 9) {
          text = 'url';
          index.add(text);
          info.add(detailsData[text]);
        }
      }
    }
    return ListView.builder(
      itemCount: detailsData == null ? 0 : detailsData.length,
      itemBuilder: (context, i) {
        return ListTile(
          leading: Icon(Icons.info),
          title: Text(
            ('${index[i]}: '),
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          subtitle: Container(
            height: 200,
            //width: 2,
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, j) {
                return ListTile(
                  title: Text('${proficiencies}'),
                );
              },
            ),
          ), //Text('${info[i]}')),
        );
      },
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
