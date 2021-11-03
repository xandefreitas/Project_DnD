import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:project_dd/common/data/store.dart';
import 'package:project_dd/model/auth.dart';
import 'package:project_dd/util/app_routes.dart';

import '../consts.dart';

class AuthWebClient {
  final Dio _dio = Dio()
    ..options.baseUrl = "${Consts.BaseUrlAuth}"
    ..options.connectTimeout = 20000;
  Auth auth;

  Future<Auth> signup(String email, String password) {
    return authenticate(email, password, 'signUp');
  }

  Future<Auth> signin(String email, String password) {
    return authenticate(email, password, 'signInWithPassword');
  }

  signOut() {
    auth = new Auth();
    return auth;
  }

  Future<Auth> authenticate(String email, String password, String urlFragment) async {
    String apiKey = Consts.BaseAPIKey;
    final response = await _dio.post('$urlFragment?key=$apiKey', data: {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    });
    auth = Auth.fromJson(response.data);
    return auth;
  }
}
