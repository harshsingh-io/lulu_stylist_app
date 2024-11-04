// lib/blocs/authentication/authentication_event.dart

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthenticationEvent {}

class LoggedIn extends AuthenticationEvent {
  final String email;
  final String password;

  const LoggedIn({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class Registered extends AuthenticationEvent {
  final String email;
  final String password;

  const Registered({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class LoggedOut extends AuthenticationEvent {}

// Public Events to handle Firebase Auth State Changes
class UserChanged extends AuthenticationEvent {
  final User user;

  const UserChanged({required this.user});

  @override
  List<Object?> get props => [user];
}

class UserLoggedOut extends AuthenticationEvent {}
