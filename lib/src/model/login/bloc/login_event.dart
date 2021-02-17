part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  const LoginButtonPressed(
      {@required this.userEmail, @required this.userPassword});
  final String userEmail;
  final String userPassword;
  @override
  List<Object> get props => [userEmail, userPassword];

  @override
  String toString() =>
      'LoginButtonPressed { username: $userEmail, password: $userPassword }';
}
