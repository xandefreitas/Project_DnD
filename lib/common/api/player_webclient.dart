import 'package:dio/dio.dart';
import 'package:project_dd/common/network/validate_response.dart';
import 'package:project_dd/model/character.dart';

import '../consts.dart';

class PlayerWebClient {
  static const String playerApiPath = 'player';

  final Dio _dio = Dio()
    ..options.baseUrl = "${Consts.BaseUrlDB}"
    ..options.connectTimeout = 10000;

  Future<String> createNewCharacter(Character character) async {
    final response = await _dio.post(
      '$playerApiPath/characters.json',
      data: character.toJson(),
    );
    validateResponse(response);
    return response.data.toString();
  }
}
