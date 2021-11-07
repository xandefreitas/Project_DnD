import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project_dd/common/api/auth_webclient.dart';
import 'package:project_dd/common/data/store.dart';
import 'package:project_dd/model/auth.dart';
import 'package:project_dd/util/app_routes.dart';

import 'components/grid_item.dart';
import 'components/home_app_bar_widget.dart';

class HomePage extends StatefulWidget {
  final Auth auth;
  const HomePage({Key key, this.auth}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime datetime;
  int timeToSignOut;
  Timer signOutTimer;
  @override
  void initState() {
    getUserData().whenComplete(() {
      timeToSignOut = datetime.difference(DateTime.now()).inSeconds;
    });
    signOutTimer = new Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (timeToSignOut <= 0) {
        setState(() {
          timer.cancel();
        });
        autoLogout();
      } else {
        timeToSignOut--;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcccbcb),
      appBar: HomeAppBarWidget(context, signOutTimer),
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
                          auth: widget.auth,
                        ),
                        GridItem(
                          navigatorPage: AppRoutes.ENCYCLOPEDIA,
                          itemImage: Image.asset(
                            'assets/images/encyclopedia.png',
                            fit: BoxFit.fill,
                          ),
                          itemLabel: 'Encyclopedia',
                          auth: widget.auth,
                        ),
                        GridItem(
                          navigatorPage: AppRoutes.BLANK,
                          itemImage: Image.asset(
                            'assets/images/spell_book_image.png',
                            fit: BoxFit.fill,
                          ),
                          itemLabel: 'Spells',
                          auth: widget.auth,
                        ),
                        GridItem(
                          navigatorPage: AppRoutes.BLANK,
                          itemImage: Image.asset(
                            'assets/images/quest_chest.png',
                            fit: BoxFit.fill,
                          ),
                          itemLabel: 'Quests',
                          auth: widget.auth,
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

  Future<void> getUserData() async {
    final userData = await Store.getMap('userData');
    if (userData.isEmpty) return;
    final expiryDate = DateTime.parse(userData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) return;

    datetime = expiryDate;
    return datetime;
  }

  autoLogout() {
    AuthWebClient().signOut();
    Store.remove('userData');
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: Text('Your session has expired!'),
          content: Text('Please sign in again!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_OR_HOME);
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}
