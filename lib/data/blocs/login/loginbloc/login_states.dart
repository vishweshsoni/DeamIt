import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginStates extends Equatable {
  const LoginStates();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginStates {}

class LoginLoading extends LoginStates {}

class LoginFailure extends LoginStates {
  final String error;

  LoginFailure({@required this.error});

  @required
  List<Object> get props => [error];

  @override
  String toString() => 'LoginFailure {error : $error.}';
}
