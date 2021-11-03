import 'package:flutter/material.dart';
import 'package:project_dd/common/api/auth_webclient.dart';
import 'package:project_dd/core/app_colors.dart';
import 'package:project_dd/src/pages/loginPage/login_page.dart';
import 'package:project_dd/util/app_routes.dart';

import 'pages/authOrHomePage.dart';
import 'pages/characterDetailsPage/character_details_page.dart';
import 'pages/charactersListPage/characters_list_page.dart';
import 'pages/classesPage/classes_list_page.dart';
import 'pages/detailsPage/details_page.dart';
import 'pages/encyclopediaPage/encyclopedia_page.dart';
import 'pages/racesPage/races_list_page.dart';

class MyApp extends StatelessWidget {
  @override
  build(context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Obtendo dados da Web - Exemplo',
      theme: ThemeData(
        primaryColor: AppColors.purplePrimary,
      ),
      initialRoute: AppRoutes.LOGIN_OR_HOME,
      routes: {
        AppRoutes.LOGIN_OR_HOME: (ctx) => AuthOrHomePage(),
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
