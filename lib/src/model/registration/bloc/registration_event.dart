part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationButtonCliked extends RegistrationEvent {
  const RegistrationButtonCliked(
      {this.userName, this.userEmail, this.userPassword});

  final String userName;
  final String userPassword;
  final String userEmail;

  @override
  List<Object> get props => [userName, userPassword, userEmail];
}
