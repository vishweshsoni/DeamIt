import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationEvents extends Equatable {
  const AuthenticationEvents();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticationEvents {}

class LoggedIn extends AuthenticationEvents {
  final String token;

  LoggedIn({@required this.token});

  @override
  List<Object> get props => [token];

  @override
  String toString() => 'LoggedIn {token : $token}';
}
class LoggedOut extends AuthenticationEvents{}
