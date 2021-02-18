import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:formz/formz.dart';

import '../authentication/authentication_bloc.dart';
import '../global_init.dart';
import '../repository/authentication_repository.dart';
import '../repository/email.dart';
import '../repository/password.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._authenticationRepository, this._authenticationBloc)
      : assert(_authenticationRepository != null, 'Repository can not be null'),
        super(const LoginState());

  final AuthenticationRepository _authenticationRepository;
  final AuthenticationBloc _authenticationBloc;

  void emailChanged(String value) {
    final email = Email.dirty(value);
    emit(state.copyWith(
        email: email, status: Formz.validate([state.password, email])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);
    emit(state.copyWith(
        password: password, status: Formz.validate([password, state.email])));
  }

  Future<void> loginWithEmail() async {
    if (!state.status.isValidated) {
      return;
    }
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      await users.doc(state.email.value).get().then((documentSnapshot) {
        if (documentSnapshot.exists &&
            state.password.value == documentSnapshot.data()['userpassword']) {
          debugPrint('Document data: ${documentSnapshot.data()}');
          _authenticationRepository
              .presistToken(documentSnapshot.data()['token'].toString());
          _authenticationBloc.add(const AuthenticationUserChanged());
          emit(state.copyWith(status: FormzStatus.submissionSuccess));
        } else {
          debugPrint('Document does not exist on the database');
          emit(state.copyWith(status: FormzStatus.submissionFailure));
        }
      });
    } on Exception {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
    }
  }
}
