part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class Signuploading extends SignupState {}

class SignUpforminvalid extends SignupState {
  final String? error;
  SignUpforminvalid({required this.error});
}

class Signupsuccesfull extends SignupState {
  final String message;
  Signupsuccesfull(this.message);
}

class Signuperror extends SignupState {
  final String error;
  Signuperror({required this.error});
}
