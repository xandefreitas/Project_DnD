import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'detailPage.dart';

const baseUrl = 'https://www.dnd5eapi.co';

class BuildListView extends StatefulWidget {
  @override
  _BuildListViewState createState() => _BuildListViewState();
}

class _BuildListViewState extends State<BuildListView> {
  dynamic data;

  Future<String> getClasses() async {
    final String url = '$baseUrl/api/classes';
    var response = await http.get(url);
    setState(() {
      data = jsonDecode(response.body)['results'];
    });

    print(data);

    return "Dados obtidos com sucesso";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            "Lista de Classes",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          subtitle: Text('$baseUrl/api/classes'),
          trailing: Icon(Icons.shield),
        ),
      ),
      body: classesList(),
    );
  }

  @override
  void initState() {
    super.initState();
    this.getClasses();
  }

  classesList() {
    return ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (context, i) {
        return exibitClasses(data[i]);
      },
    );
  }

  exibitClasses(dynamic item) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        margin: const EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            showClasses(item),
          ],
        ),
      );

  showClasses(dynamic item) {
    return ListTile(
      leading: Icon(Icons.accessibility),
      title: Text(
        '${item['name']}',
        style: TextStyle(fontSize: 20.0, color: Colors.black),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 20,
      ),
      onTap: () {
        setState(() {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                classes: item,
              ),
            ),
          );
        });
      },
    );
  }
}
