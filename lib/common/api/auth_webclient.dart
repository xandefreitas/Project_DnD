import 'package:dio/dio.dart';
import 'package:project_dd/common/network/auth_exception.dart';
import 'package:project_dd/common/network/validate_response.dart';
import 'package:project_dd/model/auth.dart';

import '../consts.dart';

class AuthWebClient {
  final Dio _dio = Dio()
    ..options.baseUrl = "${Consts.BaseUrlAuth}"
    ..options.connectTimeout = 20000;

  Future<Auth> signup(String email, String password) {
    return authenticate(email, password, 'signUp');
  }

  Future<Auth> signin(String email, String password) {
    return authenticate(email, password, 'signInWithPassword');
  }

  Future<Auth> authenticate(String email, String password, String urlFragment) async {
    final response = await _dio.post('$urlFragment?key=AIzaSyCWHyID0erO6Lgy-lYjCQifYNgohgJFNqs', data: {
      'email': email,
      'password': password,
      'returnSecureToken': true,
    });
    final auth = Auth.fromJson(response.data);
    return auth;
  }
}
