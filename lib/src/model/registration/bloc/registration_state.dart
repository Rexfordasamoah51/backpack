part of 'registration_bloc.dart';

abstract class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationFailure extends RegistrationState {
  const RegistrationFailure({this.error});
  final String error;

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'RegistrationFailure { error: $error }';
}

class RegistrationCompleted extends RegistrationState{}
