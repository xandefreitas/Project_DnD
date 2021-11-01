import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_dd/common/api/auth_webclient.dart';
import 'package:project_dd/common/network/auth_exception.dart';
import 'package:project_dd/model/auth.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Auth auth;
  final AuthWebClient authWebClient;
  AuthBloc()
      : authWebClient = AuthWebClient(),
        super(const LoginEmptyState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    try {
      if (event is SignUpFetchEvent) {
        yield SignUpFetchingState();
        auth = await authWebClient.signup(event.username, event.password);
        yield SignUpFetchedState(auth: auth);
      }
      if (event is SignInFetchEvent) {
        yield SignInFetchingState();
        auth = await authWebClient.signin(event.username, event.password);
        yield SignInFetchedState(auth: auth);
      }
    } catch (e) {
      yield AuthErrorState(cause: AuthException(e.response.data['error']['message']).toString());
    }
  }
}
