import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../appstartup/bloc/authentication_bloc.dart';
import '../../repository/user_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null, 'UserRepository can noot be null'),
        assert(
            authenticationBloc != null, ' authenticationBloc can not be null'),
        super(LoginInitial());

  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      final value = userRepository.generateToken();
      try {
        await userRepository.addUser(
            userEmail: event.userEmail,
            userPassword: event.userPassword,
            token: value);
        authenticationBloc.add(LoggedIn(token: event.userEmail));
        yield LoginInitial();
        // ignore: avoid_catches_without_on_clauses
      } catch (error) {
        yield LoginFailure(error: error.toString());
      }
    }
  }
}
