import 'package:dio/dio.dart';
import 'package:project_dd/common/network/validate_response.dart';
import 'package:project_dd/model/auth.dart';
import 'package:project_dd/model/character.dart';

import '../consts.dart';

class PlayerWebClient {
  static const String playerApiPath = 'player/characters';

  final Dio _dio = Dio()
    ..options.baseUrl = "${Consts.BaseUrlDB}"
    ..options.connectTimeout = 10000;

  Future<String> createNewCharacter(Character character, Auth token) async {
    final response = await _dio.post(
      '$playerApiPath/${token.localId}.json?auth=${token.idToken}',
      data: character.toJson(),
    );
    validateResponse(response);
    return response.data['name'];
  }

  Future<String> updateCharacter(Character character, Auth token) async {
    final response = await _dio.patch(
      '$playerApiPath/${token.localId}/${character.id}.json?auth=${token.idToken}',
      data: character.toJson(),
    );
    validateResponse(response);
    //TODO check response after characterPage is finished
    return response.statusMessage;
  }

  Future<String> deleteCharacter(String characterID, Auth token) async {
    final response = await _dio.delete(
      '$playerApiPath/${token.localId}/$characterID.json?auth=${token.idToken}',
    );
    validateResponse(response);

    return response.statusMessage;
  }

  Future<List<Character>> getCharactersList(Auth token) async {
    List<Character> charactersList = <Character>[];
    final response = await _dio.get('$playerApiPath/${token.localId}.json?auth=${token.idToken}');
    if (response.data == null) {
      return charactersList;
    }
    validateResponse(response);
    Map<String, dynamic> userData = new Map<String, dynamic>.from(response.data);
    userData.forEach((key, value) {
      charactersList.add(
        Character(
          id: key.toString(),
          name: value['name'],
          characterClass: value['characterClass'],
          race: value['race'],
          alignment: value['alignment'],
          experience: value['experience'],
          level: value['level'],
          sex: value['sex'],
          atributes: Atributes(
            strenght: value['atributes']['strenght'],
            dexterity: value['atributes']['dexterity'],
            constitution: value['atributes']['constitution'],
            intelligence: value['atributes']['intelligence'],
            wisdom: value['atributes']['wisdom'],
            charism: value['atributes']['charism'],
          ),
          skills: <String>[...value['skills']],
          equipment: <String>[...value['equipment']],
          personalityTraits: <String>[...value['personalityTraits']],
          ideals: <String>[...value['ideals']],
          bonds: <String>[...value['bonds']],
          flaws: <String>[...value['flaws']],
        ),
      );
    });
    return charactersList;
  }
}
