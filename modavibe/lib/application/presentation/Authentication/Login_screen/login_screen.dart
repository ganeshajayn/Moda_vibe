import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modavibe/Domain/utils/functions/functions.dart';
import 'package:modavibe/application/bussineslogic/login/bloc/login_bloc.dart';
import 'package:modavibe/application/presentation/Authentication/Login_screen/widgets/login_Widget.dart';
import 'package:modavibe/application/presentation/bottom_nav/bottom_nav.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is Loginloading) {
          showDialog(
            context: context,
            builder: (BuildContext context) => Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.blue, size: 40),
            ),
          );
        }
        if (state is Loginsuccesfull) {
          Navigator.pop(context);
          showCustomSnackbar(
              context, "succesfully Logged in", Colors.green, Colors.white);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const Bottomnavbar(),
              ),
              (route) => false);
        } else if (state is Loginerror) {
          Navigator.pop(context);
          showCustomSnackbar(
              context, "Checkpassword and e-mail", Colors.red, Colors.white);
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: UserloginWidget(
              formkey: formkey,
              emailcontroller: emailcontroller,
              passwordcontroller: passwordcontroller),
        ),
      ),
    );
  }
}
