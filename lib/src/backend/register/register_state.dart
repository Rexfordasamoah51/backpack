part of 'register_cubit.dart';

enum ConfirmPasswordValidationError { invalid }

class RegisterState extends Equatable {
  const RegisterState(
      {this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.confirmedPassword = const ConfirmedPassword.pure(),
      this.status = FormzStatus.pure,
      this.userName = const NameInput.pure()});

  final Email email;
  final Password password;
  final ConfirmedPassword confirmedPassword;
  final FormzStatus status;
  final NameInput userName;

  @override
  List<Object> get props =>
      [email, password, confirmedPassword, status, userName];

  RegisterState copyWith(
      {Email email,
      Password password,
      ConfirmedPassword confirmedPassword,
      FormzStatus status,
      NameInput userName}) {
    return RegisterState(
        email: email ?? this.email,
        password: password ?? this.password,
        confirmedPassword: confirmedPassword ?? this.confirmedPassword,
        status: status ?? this.status,
        userName: userName ?? this.userName);
  }
}
