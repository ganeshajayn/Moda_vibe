import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:modavibe/Data/services/auth/authrepo.dart';
import 'package:modavibe/Model/signup_model/signup_model.dart';
part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    final Authrespository authrespository = Authrespository();
    on<Signupbuttonpressed>((event, emit) async {
      emit(Signuploading());
      try {
        if (event.password != event.confirmpassword) {
          emit(SignUpforminvalid(error: 'password does not match'));
        }
        final signuprequest = Signupmodel(
            username: event.name,
            email: event.email,
            password: event.password,
            //   phone: event.phonenumber,
            confirmpasssword: event.confirmpassword);
        final response = await authrespository.signup(signuprequest);
        if (response == 'success') {
          emit(Signupsuccesfull('user signed succesfully'));
        } else {
          emit(Signuperror(error: response));
        }
      } catch (e) {
        emit(Signuperror(error: e.toString()));
      }
    });
  }
}
