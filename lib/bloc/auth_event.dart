part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class LogoutRequested extends AuthEvent {}

class UserChanged extends AuthEvent {
  @visibleForTesting
  const UserChanged(this.user);

  final User user;

  @override
  List<Object> get props => [user];
}
