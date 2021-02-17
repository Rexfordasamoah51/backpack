import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../appstartup/bloc/authentication_bloc.dart';
import '../../repository/user_repository.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc(
      {@required this.authenticationBloc, @required this.userRepository})
      : assert(userRepository != null, "userRepository can't be null"),
        super(RegistrationInitial());

  final AuthenticationBloc authenticationBloc;
  final UserRepository userRepository;

  @override
  Stream<RegistrationState> mapEventToState(
    RegistrationEvent event,
  ) async* {
    if (event is RegistrationButtonCliked) {
      yield RegistrationLoading();
      try {
        final token = userRepository.generateToken();
        await userRepository.addUser(
            token: token,
            userEmail: event.userEmail,
            userName: event.userName,
            userPassword: event.userPassword);
        authenticationBloc.add(RegisterAccount());
        yield RegistrationInitial();
        // ignore: avoid_catches_without_on_clauses
      } catch (error) {
        yield RegistrationFailure(error: error.toString());
      }
    }
  }
}
