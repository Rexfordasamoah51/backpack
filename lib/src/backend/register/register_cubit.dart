import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';

import '../authentication/authentication_bloc.dart';
import '../global_init.dart';
import '../repository/authentication_repository.dart';
import '../repository/confirm_password.dart';
import '../repository/email.dart';
import '../repository/name.dart';
import '../repository/password.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authenticationRepository, this.authenticationBloc)
      : assert(_authenticationRepository != null,
            'authentiationRepo an not be null'),
        super(const RegisterState());

  final AuthenticationRepository _authenticationRepository;
  final AuthenticationBloc authenticationBloc;
  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
      email: email,
      status: Formz.validate(
          [email, state.password, state.userName, state.confirmedPassword]),
    ));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
      password: password,
      status: Formz.validate(
          [state.email, password, state.userName, state.confirmedPassword]),
    ));
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = ConfirmedPassword.dirty(
      password: state.password.value,
      value: value,
    );
    emit(state.copyWith(
      confirmedPassword: confirmPassword,
      status: Formz.validate(
          [state.email, state.password, state.userName, confirmPassword]),
    ));
  }

  void userNameChanged(String value) {
    final username = NameInput.dirty(value: value);
    emit(state.copyWith(
        userName: username,
        status: Formz.validate(
            [state.email, state.password, username, state.confirmedPassword])));
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) {
      return;
    }
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await users.doc(state.email.value).get().then((documentSnapshot) {
        if (documentSnapshot.exists) {
          debugPrint('Document data: ${documentSnapshot.data()}');
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        } else {
          debugPrint('Document does not exist on the database');
          final token = _authenticationRepository.generateToken();
          _authenticationRepository
            ..presistToken(token)
            ..addUser(
                token: token,
                userEmail: state.email.value,
                userName: state.userName.value,
                userPassword: state.password.value);
          authenticationBloc.add(const AuthenticationUserChanged());
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        }
      });
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
