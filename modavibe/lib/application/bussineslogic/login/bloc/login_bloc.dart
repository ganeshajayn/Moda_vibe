import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:modavibe/Data/services/auth/authrepo.dart';
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
        if (response == 'success') {
          emit(Loginsuccesfull("succefully loggged in"));
        } else {
          emit(Loginerror(response));
        }
      } catch (e) {
        emit(Loginerror(e.toString()));
      }
    });
  }
}
