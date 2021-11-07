import 'package:flutter/material.dart';
import 'package:project_dd/core/app_colors.dart';
import 'package:project_dd/model/character.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget(BuildContext context, Character character)
      : super(
          preferredSize: Size.fromHeight(250),
          child: Container(
            height: 150,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(color: AppColors.purplePrimary),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  height: 150,
                  width: double.maxFinite,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        flex: 6,
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: 'name',
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                          onSaved: (name) => character.name = name,
                          validator: (_name) {
                            final name = _name ?? '';

                            if (name.trim().isEmpty) {
                              return 'Required';
                            }
                            if (name.trim().length < 5) {
                              return '5 characters minimum';
                            }
                            if (name.trim().length > 15) {
                              return '15 characters maximum';
                            }
                            return null;
                          },
                        ),
                      ),
                      Flexible(
                        child: Container(),
                        flex: 4,
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment(1.0, 2.0),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 140,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                            'https://cdn.dribbble.com/users/1018698/screenshots/4826230/media/914f6b9ac9c1cac21d3bd6fa471b2356.png?compress=1&resize=800x600',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
