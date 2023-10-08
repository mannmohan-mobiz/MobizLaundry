part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class UserLoginEvent extends AuthEvent {
  final String username;
  final String password;

  UserLoginEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}