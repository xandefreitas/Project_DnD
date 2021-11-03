import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SignUpFetchEvent extends AuthEvent {
  final String username;
  final String password;
  const SignUpFetchEvent(this.username, this.password);

  @override
  List<Object> get props => [];
}

class SignInFetchEvent extends AuthEvent {
  final String username;
  final String password;
  const SignInFetchEvent(this.username, this.password);

  @override
  List<Object> get props => [];
}

class SignOutFetchEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}
