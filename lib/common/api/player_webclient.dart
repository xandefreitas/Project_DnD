import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:project_dd/common/network/validate_response.dart';
import 'package:project_dd/model/character.dart';

import '../consts.dart';

class PlayerWebClient {
  static const String playerApiPath = 'player/characters';

  final Dio _dio = Dio()
    ..options.baseUrl = "${Consts.BaseUrlDB}"
    ..options.connectTimeout = 10000;

  Future<String> createNewCharacter(Character character) async {
    final response = await _dio.post(
      '$playerApiPath.json',
      data: character.toJson(),
    );
    validateResponse(response);
    return response.data['name'];
  }

  Future<String> updateCharacter(Character character) async {
    final response = await _dio.patch(
      '$playerApiPath/${character.id}.json',
      data: character.toJson(),
    );
    validateResponse(response);
    //TODO check response after characterPage is finished
    return response.data['name'];
  }

  Future<String> deleteCharacter(Character character) async {
    final response = await _dio.delete(
      '$playerApiPath/${character.id}.json',
    );
    validateResponse(response);

    return response.data['name'];
  }

  Future<List<Character>> getCharactersList() async {
    List<Character> charactersList = <Character>[];
    final response = await _dio.get('$playerApiPath.json');
    if (response.data == null) {
      return charactersList;
    }
    validateResponse(response);
    Map<String, dynamic> userData = new Map<String, dynamic>.from(response.data);
    userData.forEach((key, value) {
      charactersList.add(
        Character(
          id: key.toString(),
          alignment: value["alignment"],
          characterClass: value["characterClass"],
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
