part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class Signupbuttonpressed extends SignupEvent {
  final String name;
  final String email;
  final String phonenumber;
  final String password;
  final String confirmpassword;
  Signupbuttonpressed(
      {required this.email,
      required this.name,
      required this.phonenumber,
      required this.password,
      required this.confirmpassword});
}
