import 'package:flutter/material.dart';
import 'pages/classesList.dart';

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Obtendo dados da Web - Exemplo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ClassesList(),
    );
  }
}
