import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project_dd/common/network/validate_response.dart';
import 'package:project_dd/model/character.dart';

import '../consts.dart';

class PlayerWebClient {
  static const String playerApiPath = 'player/characters.json';

  final Dio _dio = Dio()
    ..options.baseUrl = "${Consts.BaseUrlDB}"
    ..options.connectTimeout = 10000;

  Future<String> createNewCharacter(Character character) async {
    final response = await _dio.post(
      '$playerApiPath',
      data: character.toJson(),
    );
    validateResponse(response);
    return response.data['name'];
  }

  Future<List<Character>> getCharactersList() async {
    final response = await _dio.get('$playerApiPath');
    validateResponse(response);
    List<Character> charactersList = <Character>[];
    Map<String, dynamic> userData = new Map<String, dynamic>.from(response.data);
    userData.forEach((key, value) {
      charactersList.add(
        Character(
          id: key.toString(),
          alignment: value["alignment"],
          experience: value["experience"],
          level: value["level"],
          name: value["name"],
          race: value["race"],
          sex: value["sex"],
        ),
      );
    });
    return charactersList;
  }
}
