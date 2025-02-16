import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modavibe/Domain/utils/functions/functions.dart';
import 'package:modavibe/application/bussineslogic/signup/bloc/signup_bloc.dart';
import 'package:modavibe/application/presentation/Authentication/Login_screen/login_screen.dart';

import 'package:modavibe/application/presentation/Authentication/Signup_screen/widgets/signup_widget.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});
  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController confirmpasswordcontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    TextEditingController phonenumber = TextEditingController();
    final formkey = GlobalKey<FormState>();

    return BlocListener<SignupBloc, SignupState>(
      listener: (context, state) {
        if (state is Signuploading) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => Center(
                  child: LoadingAnimationWidget.threeArchedCircle(
                      color: Colors.blue, size: 40)));
        } else if (state is Signupsuccesfull) {
          Navigator.pop(context);
          showCustomSnackbar(
              context, "Signed Up successfully", Colors.green, Colors.white);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => true);
        } else if (state is Signuperror) {
          Navigator.pop(context);
          showCustomSnackbar(
              context, "SignUp failed", Colors.red, Colors.white);
        }
      },
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Signupwidget(
                namecontroller: namecontroller,
                emailcontroller: emailcontroller,
                passwordcontroller: passwordcontroller,
                formkey: formkey,
                phonenumbercontroller: phonenumber,
                confirmpasswordcontroller: confirmpasswordcontroller),
          ),
        ),
      )),
    );
  }
}
