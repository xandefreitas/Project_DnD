import 'package:flutter/material.dart';
import 'package:project_dd/common/data/store.dart';
import 'package:project_dd/model/auth.dart';

import 'homePage/home_page.dart';
import 'loginPage/login_page.dart';

class AuthOrHomePage extends StatefulWidget {
  const AuthOrHomePage({Key key}) : super(key: key);

  @override
  State<AuthOrHomePage> createState() => _AuthOrHomePageState();
}

class _AuthOrHomePageState extends State<AuthOrHomePage> {
  Auth auth;
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (auth?.idToken != null) {
      return HomePage(auth: auth);
    } else {
      return LoginPageContainer();
    }
  }

  Future<Auth> getUserData() async {
    final userData = await Store.getMap('userData');
    if (userData.isEmpty) return Auth();
    final expiryDate = DateTime.parse(userData['expiryDate']);
    if (expiryDate.isBefore(DateTime.now())) return Auth();
    setState(() {
      auth = Auth.fromJson(userData['auth']);
    });
    return auth;
  }
}
