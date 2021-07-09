import 'package:flutter/material.dart';
import 'package:temis_front/src/pages/homePage/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffcccbcb),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Project EXP',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple[900],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/login_icon.png',
              ),
            ),
          ),
          Positioned(
              bottom: 60,
              right: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(hintText: 'Usuário'),
                    ),
                    TextField(
                      decoration: InputDecoration(hintText: 'Senha'),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple[900],
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Text(
                            'Registrar-se',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple[900],
                            elevation: 0,
                            shadowColor: Colors.transparent,
                          ),
                          onPressed: () => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          ),
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
