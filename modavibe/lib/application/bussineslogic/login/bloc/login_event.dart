part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class Loginbuttonpressed extends LoginEvent {
  final String email;
  final String password;
  Loginbuttonpressed({required this.email, required this.password});
}
