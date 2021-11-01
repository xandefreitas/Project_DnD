import 'package:flutter/material.dart';
import 'package:project_dd/src/pages/loginPage/login_page.dart';
import 'package:project_dd/util/app_routes.dart';

import 'pages/characterDetailsPage/character_details_page.dart';
import 'pages/charactersListPage/characters_list_page.dart';
import 'pages/classesPage/classes_list_page.dart';
import 'pages/detailsPage/details_page.dart';
import 'pages/encyclopediaPage/encyclopedia_page.dart';
import 'pages/homePage/home_page.dart';
import 'pages/racesPage/races_list_page.dart';

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Obtendo dados da Web - Exemplo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.LOGIN: (ctx) => LoginPageContainer(),
        AppRoutes.HOME: (ctx) => HomePage(),
        AppRoutes.ENCYCLOPEDIA: (ctx) => EncyclopediaPage(),
        AppRoutes.CHARACTER_LIST: (ctx) => CharactersListContainer(),
        AppRoutes.BLANK: (ctx) => Scaffold(
              appBar: AppBar(),
            ),
        AppRoutes.CHARACTER_DETAILS: (ctx) => CharacterDetailsContainer(),
        AppRoutes.CLASSES: (ctx) => ClassesListPage(),
        AppRoutes.RACES: (ctx) => RacesListPage(),
        AppRoutes.CLASS_DETAIL: (ctx) => DetailsPage(),
      },
    );
  }
}
