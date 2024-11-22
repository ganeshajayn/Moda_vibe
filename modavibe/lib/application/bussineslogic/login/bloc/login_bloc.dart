import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavibe/Data/api/auth/authrepo.dart';
import 'package:modavibe/Model/login_model/login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    final Authrespository authrespository = Authrespository();
    on<Loginbuttonpressed>((event, emit) async {
      emit(Loginloading());
      try {
        final loginrequest =
            Loginmodel(email: event.email, password: event.password);
        final response = await authrespository.login(loginrequest);
        if (response == 'OK') {
          emit(Loginsuccesfull("succefully loggged in"));
        } else {
          emit(Loginerror(response));
          print(response);
        }
      } catch (e) {
        emit(Loginerror(e.toString()));
      }
    });
  }
}
