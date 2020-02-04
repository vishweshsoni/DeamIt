import 'package:equatable/equatable.dart';

abstract class AuthenticationStates extends Equatable{
    @override
    List<Object> get props=>[];
}
class AuthenticationUninitialized extends AuthenticationStates{}
class AuthenticationAuthenticated extends AuthenticationStates{}
class AuthenticationUnauthenticated extends AuthenticationStates{}
class AuthenticationLoading extends AuthenticationStates{}


