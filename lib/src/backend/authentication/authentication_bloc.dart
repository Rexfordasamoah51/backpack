import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../data/user.dart';
import '../global_init.dart';
import '../repository/authentication_repository.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    @required AuthenticationRepository authenticationRepository,
  })  : assert(authenticationRepository != null,
            'AuthenticationRepository can not be null'),
        _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown());
  //        {
  //   _userSubscription = _authenticationRepository.user.listen(
  //     (user) => add(AuthenticationUserChanged(user: user)),
  //   );
  // }

  final AuthenticationRepository _authenticationRepository;
  StreamSubscription<User> _userSubscription;

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      final hasToken = await _authenticationRepository.hasToken();
      if (hasToken) {
        yield const AuthenticationState.authenticated();
        debugPrint('Yes');
      } else {
        yield const AuthenticationState.unauthenticated();
        debugPrint('No');
      }
    }
    if (event is AuthenticationUserChanged) {
      final token = await readToken();
      yield _mapAuthenticationUserChangedToState(event, token);
    } else if (event is AuthenticationLogoutRequested) {
      // unawaited(_authenticationRepository.);
    }
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  Future<String> readToken() async {
    final user = await storage.read(key: 'token');
    return user;
  }

  AuthenticationState _mapAuthenticationUserChangedToState(
      AuthenticationUserChanged event, String token) {
    return token != null
        ? AuthenticationState.authenticated(event.user)
        : const AuthenticationState.unauthenticated();
  }
}
