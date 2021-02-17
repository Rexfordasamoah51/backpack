import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({this.email, this.password, this.username});
  final String email;
  final String password;
  final String username;

  static const empty = User(email: '', password: '', username: '');
  @override
  List<Object> get props => [email, password, username];
}
