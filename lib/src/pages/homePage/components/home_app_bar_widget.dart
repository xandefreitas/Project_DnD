import 'package:flutter/material.dart';
import 'package:project_dd/core/app_colors.dart';

class HomeAppBarWidget extends PreferredSize {
  HomeAppBarWidget(BuildContext context, GlobalKey<ScaffoldState> key)
      : super(
          preferredSize: Size.fromHeight(200),
          child: Container(
            height: 200,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: AppColors.purplePrimary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // child: Container(),
                ),
                Align(
                  alignment: Alignment(-1.0, 0.8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: 140,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(15),
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
                  padding: const EdgeInsets.only(top: 24),
                  child: IconButton(
                    onPressed: () => key.currentState.openEndDrawer(),
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}
