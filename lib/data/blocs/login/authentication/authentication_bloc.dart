import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paginate/data/blocs/login/authentication/authentication_events.dart';
import 'package:paginate/data/blocs/login/authentication/authentication_states.dart';
import 'package:paginate/data/blocs/login/models/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvents, AuthenticationStates> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);



  @override
  AuthenticationStates get initialState => throw AuthenticationUninitialized();

  @override
  Stream<AuthenticationStates> mapEventToState(AuthenticationEvents event) async*{
    if(event is AppStarted){
        final bool hasToken = await userRepository.hasToken();
        if(hasToken){
          yield AuthenticationAuthenticated();
        }else{
            yield AuthenticationUnauthenticated();
        }

    }

    if(event is LoggedIn){
        yield AuthenticationAuthenticated();
    }else{
        yield AuthenticationUnauthenticated();
    }

    if(event is LoggedOut){
        yield AuthenticationLoading();
        await userRepository.deleteToken();
        yield AuthenticationUnauthenticated();
    }
  }
}
