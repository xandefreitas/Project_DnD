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
                        color: Colors.purple[900],
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
                          itemImage: Image.asset(
                            'assets/images/sword.png',
                          ),
                          itemLabel: 'Characters',
                        ),
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ClassesListPage(),
                            ),
                          ),
                          child: GridItem(
                            itemImage: Image.asset(
                              'assets/images/sword.png',
                            ),
                            itemLabel: 'Encyclopedia',
                          ),
                        ),
                        GridItem(
                          itemImage: Image.asset(
                            'assets/images/spells_book_image.png',
                          ),
                          itemLabel: 'Spells',
                        ),
                        GridItem(
                          itemImage: Image.asset(
                            'assets/images/sword.png',
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
