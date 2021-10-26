import 'package:flutter/material.dart';
import 'package:project_dd/core/app_colors.dart';

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
      cursorColor: AppColors.purplePrimary,
      scrollPadding: EdgeInsets.symmetric(horizontal: 20),
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.5),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.purplePrimary,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.purplePrimary,
            width: 2,
          ),
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.purplePrimary,
        ),
      ),
      style: TextStyle(color: AppColors.purplePrimary),
    );
  }
}
