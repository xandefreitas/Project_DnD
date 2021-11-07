import 'package:flutter/material.dart';
import 'package:project_dd/core/app_colors.dart';
import 'package:project_dd/model/character.dart';

class StatsRowWidget extends StatelessWidget {
  const StatsRowWidget({
    Key key,
    @required this.characterAtributes,
  }) : super(key: key);

  final Atributes characterAtributes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 60,
            width: 30,
            child: Column(
              children: [
                Text('STR'),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            labelStyle: TextStyle(color: AppColors.purplePrimary),
                            alignLabelWithHint: true,
                            labelText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff9F9F9F),
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onSaved: (value) => characterAtributes.strenght = int.parse(value.isEmpty ? '0' : value),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 60,
            width: 30,
            child: Column(
              children: [
                Text('DEX'),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            labelStyle: TextStyle(color: AppColors.purplePrimary),
                            alignLabelWithHint: true,
                            labelText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff9F9F9F),
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onSaved: (value) => characterAtributes.dexterity = int.parse(value.isEmpty ? '0' : value),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 60,
            width: 30,
            child: Column(
              children: [
                Text('CON'),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            labelStyle: TextStyle(color: AppColors.purplePrimary),
                            alignLabelWithHint: true,
                            labelText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff9F9F9F),
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onSaved: (value) => characterAtributes.constitution = int.parse(value.isEmpty ? '0' : value),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 60,
            width: 30,
            child: Column(
              children: [
                Text('INT'),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            labelStyle: TextStyle(color: AppColors.purplePrimary),
                            alignLabelWithHint: true,
                            labelText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff9F9F9F),
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onSaved: (value) => characterAtributes.intelligence = int.parse(value.isEmpty ? '0' : value),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 60,
            width: 30,
            child: Column(
              children: [
                Text('WIS'),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            labelStyle: TextStyle(color: AppColors.purplePrimary),
                            alignLabelWithHint: true,
                            labelText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff9F9F9F),
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onSaved: (value) => characterAtributes.wisdom = int.parse(value.isEmpty ? '0' : value),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 60,
            width: 30,
            child: Column(
              children: [
                Text('CHA'),
                Row(
                  children: [
                    Flexible(
                      child: Container(
                        height: 40,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purplePrimary),
                            ),
                            labelStyle: TextStyle(color: AppColors.purplePrimary),
                            alignLabelWithHint: true,
                            labelText: '',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff9F9F9F),
                              ),
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          onSaved: (value) => characterAtributes.charism = int.parse(value.isEmpty ? '0' : value),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
