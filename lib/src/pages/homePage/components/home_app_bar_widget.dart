import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dd/common/bloc/authBloc/auth_bloc.dart';
import 'package:project_dd/common/bloc/authBloc/auth_event.dart';
import 'package:project_dd/common/bloc/authBloc/auth_state.dart';
import 'package:project_dd/common/data/store.dart';
import 'package:project_dd/core/app_colors.dart';
import 'package:project_dd/util/app_routes.dart';

class HomeAppBarWidget extends PreferredSize {
  HomeAppBarWidget(BuildContext context, Timer timer)
      : super(
          preferredSize: Size.fromHeight(200),
          child: BlocProvider(
            create: (context) => AuthBloc(),
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {},
              builder: (context, state) {
                return Container(
                  height: 200,
                  child: Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: AppColors.purplePrimary,
                          borderRadius: BorderRadius.circular(15),
                        ),
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
                          onPressed: () {
                            timer.cancel();
                            Store.remove('userData');
                            context.read<AuthBloc>().add(SignOutFetchEvent());
                            Navigator.pushReplacementNamed(context, AppRoutes.LOGIN_OR_HOME);
                          },
                          icon: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
}
