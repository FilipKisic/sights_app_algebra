import 'package:firebase_auth/firebase_auth.dart';

sealed class SignInState {}

final class InitialState extends SignInState {}

final class LoadingState extends SignInState {}

final class AuthenticatedState extends SignInState {
  final User user;

  AuthenticatedState(this.user);
}

final class ErrorState extends SignInState {
  final Exception exception;

  ErrorState(this.exception);
}