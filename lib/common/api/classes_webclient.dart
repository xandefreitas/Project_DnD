import 'package:dio/dio.dart';
import 'package:project_dd/common/network/validate_response.dart';
import 'package:project_dd/model/classes.dart';
import 'package:project_dd/model/details.dart';

import '../consts.dart';

class ClassesWebClient {
  static const String classesApiPath = 'classes';

  final Dio _dio = Dio()
    ..options.baseUrl = "${Consts.BaseUrl}"
    ..options.connectTimeout = 10000;

  Future<Classes> getClassesListPage() async {
    final response = await _dio.get('$classesApiPath');
    validateResponse(response);
    return Classes.fromJson(response.data);
  }

  Future<ClassDetails> getClassInfo(String classInfoName) async {
    final response = await _dio.get('$classesApiPath/${classInfoName.toLowerCase()}');
    validateResponse(response);
    return ClassDetails.fromJson(response.data);
  }
}
