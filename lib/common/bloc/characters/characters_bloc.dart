import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dd/common/api/player_webclient.dart';
import 'package:project_dd/model/character.dart';
import 'package:project_dd/util/erro_util.dart';

import 'characters_event.dart';
import 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final PlayerWebClient _playerWebClient;

  CharactersBloc()
      : _playerWebClient = PlayerWebClient(),
        super(const CharactersInitState());

  @override
  Stream<CharactersState> mapEventToState(CharactersEvent event) async* {
    try {
      if (event is CharacterCreationEvent) {
        yield CreatingCharacterState();
        final characterID = await _playerWebClient.createNewCharacter(event.character, event.token);
        yield CreatedCharacterState(characterID: characterID);
      }
      if (event is CharacterUpdateEvent) {
        yield UpdatingCharacterState();
        final characterID = await _playerWebClient.updateCharacter(event.character, event.token);
        yield UpdatedCharacterState(characterID: characterID);
      }
      if (event is CharacterDeleteEvent) {
        yield DeletingCharacterState();
        final characterID = await _playerWebClient.deleteCharacter(event.characterID, event.token);
        yield DeletedCharacterState(characterID: characterID);
      }
      if (event is CharactersListFetchEvent) {
        yield CharactersListFetchingState();
        final List<Character> characters = await _playerWebClient.getCharactersList(event.token);
        yield CharactersListFetchedState(characters: characters);
      }
    } catch (e) {
      yield CharactersErrorState(exception: ErroUtil.validarException(e.response.data), event: event);
    }
  }
}
