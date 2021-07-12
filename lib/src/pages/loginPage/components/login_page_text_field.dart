import 'package:flutter/material.dart';

class LoginPageTextField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  const LoginPageTextField({
    Key key,
    @required this.hintText,
    @required this.isPassword,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      cursorColor: Color(0xff4d3e7d),
      scrollPadding: EdgeInsets.symmetric(horizontal: 20),
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.5),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff4d3e7d),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff4d3e7d),
            width: 2,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: Color(0xff4d3e7d),
        ),
      ),
      style: TextStyle(color: Color(0xff4d3e7d)),
    );
  }
}
