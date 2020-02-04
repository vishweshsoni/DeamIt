import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paginate/data/blocs/login/authentication/authentication.dart';
import 'package:paginate/data/blocs/login/loginbloc/login_events.dart';
import 'package:paginate/data/blocs/login/loginbloc/login_states.dart';
import 'package:paginate/data/blocs/login/models/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({@required this.userRepository, @required this.authenticationBloc})
      : assert(userRepository != null),
        assert(AuthenticationBloc != null);

  @override
  LoginStates get initialState => LoginInitial();

  @override
  Stream<LoginStates> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(LoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }


}
