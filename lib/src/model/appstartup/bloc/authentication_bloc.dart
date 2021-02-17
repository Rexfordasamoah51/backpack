import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

import '../../repository/user_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null, "User Repository can't be null"),
        super(AuthenticationUninitialized());

  final UserRepository userRepository;

  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final hasToken = await userRepository.hasToken();

      if (hasToken) {
        yield AuthenticationAuthenticated();
        debugPrint('Yes');
      } else {
        yield AuthenticationUnauthenticated();
        debugPrint('No');
      }
    }
    if (event is LoggedIn) {
      yield AuthenticationLoading();
      await userRepository.persistToken();
      yield AuthenticationAuthenticated();
    }
    if (event is RegisterAccount) {
      yield AuthenticationLoading();
      await userRepository.persistToken();
      debugPrint('Authentication has started');
      yield AuthenticationAuthenticated();
    }
    if (event is LoggedOut) {
      yield AuthenticationLoading();
      await userRepository.deleteToken();
      yield AuthenticationUnauthenticated();
    }
  }
}
