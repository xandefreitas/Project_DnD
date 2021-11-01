import 'package:flutter/material.dart';
import 'package:project_dd/util/app_routes.dart';

import 'components/grid_item.dart';
import 'components/home_app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Color(0xFFcccbcb),
      key: _scaffoldKey,
      appBar: HomeAppBarWidget(context, _scaffoldKey),
      endDrawer: Drawer(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Color(0xFFcccbcb),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 3,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                backgroundColor: Colors.green[200],
                                color: Colors.green,
                                minHeight: 24,
                                value: 0.4,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'User Level:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '54',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: GridView(
                      // physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1,
                      ),
                      children: [
                        GridItem(
                          navigatorPage: AppRoutes.CHARACTER_LIST,
                          itemImage: Image.asset(
                            'assets/images/characters.png',
                            fit: BoxFit.fill,
                          ),
                          itemLabel: 'Characters',
                        ),
                        GridItem(
                          navigatorPage: AppRoutes.ENCYCLOPEDIA,
                          itemImage: Image.asset(
                            'assets/images/encyclopedia.png',
                            fit: BoxFit.fill,
                          ),
                          itemLabel: 'Encyclopedia',
                        ),
                        GridItem(
                          navigatorPage: AppRoutes.BLANK,
                          itemImage: Image.asset(
                            'assets/images/spell_book_image.png',
                            fit: BoxFit.fill,
                          ),
                          itemLabel: 'Spells',
                        ),
                        GridItem(
                          navigatorPage: AppRoutes.BLANK,
                          itemImage: Image.asset(
                            'assets/images/quest_chest.png',
                            fit: BoxFit.fill,
                          ),
                          itemLabel: 'Quests',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  openDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }
}
