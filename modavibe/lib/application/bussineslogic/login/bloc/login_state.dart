part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class Loginloading extends LoginState {}

class Loginformvalid extends LoginState {
  final String? error;
  Loginformvalid({required this.error});
}

class Loginsuccesfull extends LoginState {
  final String message;
  Loginsuccesfull(this.message);
}

class Loginerror extends LoginState {
  final String error;
  Loginerror(this.error);
}
