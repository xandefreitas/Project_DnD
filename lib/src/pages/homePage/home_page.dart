import 'package:flutter/material.dart';
import 'package:temis_front/src/pages/classesPage/classes_list_page.dart';

import 'components/grid_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFcccbcb),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Color(0xff4d3e7d),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('User Level'),
                          Text(
                            '54',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: LinearProgressIndicator(
                              backgroundColor: Colors.green[200],
                              color: Colors.green,
                              minHeight: 24,
                              value: 0.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    child: GridView(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      children: [
                        GridItem(
                          navigatorPage: Scaffold(),
                          itemImage: Image.asset(
                            'assets/images/characters.png',
                            scale: 6,
                          ),
                          itemLabel: 'Characters',
                        ),
                        GridItem(
                          navigatorPage: ClassesListPage(),
                          itemImage: Image.asset(
                            'assets/images/encyclopedia.png',
                            scale: 3,
                          ),
                          itemLabel: 'Encyclopedia',
                        ),
                        GridItem(
                          navigatorPage: Scaffold(),
                          itemImage: Image.asset(
                            'assets/images/spell_book_image.png',
                            scale: 2.5,
                          ),
                          itemLabel: 'Spells',
                        ),
                        GridItem(
                          navigatorPage: Scaffold(),
                          itemImage: Image.asset(
                            'assets/images/quest_chest.png',
                            scale: 4.5,
                          ),
                          itemLabel: 'Quests',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
