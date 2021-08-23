import 'package:dio/dio.dart';
import 'package:project_dd/common/network/validate_response.dart';
import 'package:project_dd/model/races.dart';

import '../consts.dart';

class RacesWebClient {
  static const String racesApiPath = 'races';

  final Dio _dio = Dio()
    ..options.baseUrl = "${Consts.BaseUrl}"
    ..options.connectTimeout = 10000;

  Future<Races> getRacesListPage() async {
    final response = await _dio.get('$racesApiPath');
    validateResponse(response);
    return Races.fromJson(response.data);
  }

  // Future<Details> getRaceInfo(String raceInfoName) async {
  //   final response = await _dio.get('$racesApiPath/${raceInfoName.toLowerCase()}');
  //   validateResponse(response);
  //   return Details.fromJson(response.data);
  // }
}
