import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_dd/src/pages/classesPage/classes_list_page.dart';
import 'package:project_dd/src/pages/racesPage/races_list_page.dart';

import 'components/encyclopedia_card.dart';

List<String> imgList = [
  'https://imgix.kotaku.com.au/content/uploads/sites/3/2020/10/26/otv2bzzywvhkstp9prul1.jpg?ar=16%3A9&auto=format&fit=crop&q=80&w=1280&nr=20',
  'https://www.dungeonsolvers.com/wp-content/uploads/2018/10/races_of_ravenloft_by_everwho-d3k86y7-1-640x351.jpg',
  'https://www.gamersdecide.com/sites/default/files/styles/news_images/public/general_1.jpg',
  'https://dnd5e.info/wp-content/uploads/2018/07/30-Day-Challenge-Day-26-Favourite-Non-Magic-Item.jpg',
];

class EncyclopediaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Container(
        color: Color(0xff4d3e7d),
        height: MediaQuery.of(context).size.height,
        child: CarouselSlider(
          options: CarouselOptions(
            enlargeCenterPage: true,
            height: MediaQuery.of(context).size.height * 0.55,
          ),
          items: [
            EncyclopediaCard(
              imageValue: 0,
              cardName: 'Classes',
              cardPage: ClassesListPage(),
            ),
            EncyclopediaCard(
              imageValue: 1,
              cardName: 'Races',
              cardPage: RacesListPage(),
            ),
            EncyclopediaCard(
              imageValue: 2,
              cardName: 'Monsters',
              cardPage: ClassesListPage(),
            ),
            EncyclopediaCard(
              imageValue: 3,
              cardName: 'Equipment',
              cardPage: ClassesListPage(),
            ),
          ],
        ),
      ),
    );
  }
}
