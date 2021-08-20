import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:project_dd/src/pages/classesPage/classes_list_page.dart';

import 'components/encyclopedia_card.dart';

List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://dnd5e.info/wp-content/uploads/2018/07/30-Day-Challenge-Day-26-Favourite-Non-Magic-Item.jpg',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
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
              cardPage: ClassesListPage(),
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
