import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:project_dd/model/auth.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class LoginEmptyState extends AuthState {
  const LoginEmptyState();
}

class SignUpFetchingState extends AuthState {}

class SignUpFetchedState extends AuthState {
  final Auth auth;
  const SignUpFetchedState({@required this.auth});

  @override
  List<Object> get props => [this.auth];
}

class SignInFetchingState extends AuthState {}

class SignInFetchedState extends AuthState {
  final Auth auth;
  const SignInFetchedState({@required this.auth});

  @override
  List<Object> get props => [this.auth];
}

class AuthErrorState extends AuthState {
  final String cause;

  const AuthErrorState({@required this.cause});

  @override
  List<Object> get props => [cause];
}
