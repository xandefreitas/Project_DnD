import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioInstance {
  static DioInstance _dioSingleton;
  Dio _http;

  factory DioInstance() {
    if (_dioSingleton == null) _dioSingleton = DioInstance._internal();
    return _dioSingleton;
  }

  @visibleForTesting
  factory DioInstance.test(Dio http) {
    _dioSingleton = DioInstance._internalHttp(http);
    return _dioSingleton;
  }

  DioInstance._internal() {
    _http = Dio();
  }

  DioInstance._internalHttp(Dio http) {
    _http = http;
  }

  dispose() {
    _http.close();
  }

  Dio getApiClient(String baseUrl, List<Interceptor> interceptors) {
    _http.interceptors.clear();
    if (interceptors.isNotEmpty) {
      _http.interceptors.addAll(interceptors);
    }
    _http.options.baseUrl = baseUrl;
    _http.options.connectTimeout = 10000;
    return _http;
  }

}
