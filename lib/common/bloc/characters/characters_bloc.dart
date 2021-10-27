import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dd/common/api/player_webclient.dart';
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
        final characterID = await _playerWebClient.createNewCharacter(event.character);
        yield CreatedCharacterState(characterID: characterID);
      }
    } catch (e) {
      yield CharactersErrorState(exception: ErroUtil.validarException(e), event: event);
    }
  }
}
