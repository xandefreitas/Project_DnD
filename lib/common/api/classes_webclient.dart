import 'package:dio/dio.dart';
import 'package:temis_front/common/network/validate_response.dart';
import 'package:temis_front/model/classes.dart';
import 'package:temis_front/model/details.dart';

import '../consts.dart';

class ClassesWebClient {
  static const String classesApiPath = 'classes';

  final Dio _dio = Dio()
    ..options.baseUrl = "${Consts.BaseUrl}"
    ..options.connectTimeout = 10000;

  Future<Classes> getClassesList() async {
    final response = await _dio.get('$classesApiPath');
    validateResponse(response);
    return Classes.fromJson(response.data);
  }

  Future<Details> getClassInfo(String classInfoName) async {
    final response =
        await _dio.get('$classesApiPath/${classInfoName.toLowerCase()}');
    validateResponse(response);
    return Details.fromJson(response.data);
  }
}
