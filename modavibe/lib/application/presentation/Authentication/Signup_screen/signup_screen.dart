import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:modavibe/Domain/utils/functions/functions.dart';
import 'package:modavibe/application/bussineslogic/signup/bloc/signup_bloc.dart';
import 'package:modavibe/application/presentation/Authentication/Signup_screen/widgets/signup_widget.dart';
import 'package:modavibe/application/presentation/home_Screen/home_screen.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();
    TextEditingController confirmpasswordcontroller = TextEditingController();
    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();
    final formkey = GlobalKey<FormState>();

    return Scaffold(
      body: MultiBlocListener(
        listeners: [
          BlocListener<SignupBloc, SignupState>(
            listener: (context, state) {
              if (state is Signuploading) {
                // Show loading dialog
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (BuildContext context) => Center(
                    child: LoadingAnimationWidget.threeArchedCircle(
                        color: Colors.blue, size: 40),
                  ),
                );
              } else if (state is Signupsuccesfull) {
                // Remove loading dialog and navigate to the home screen
                Navigator.pop(context);
                showCustomSnackbar(context, "Signed up successfully",
                    Colors.green, Colors.white);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => Homescreen()),
                    (route) => false);
              } else if (state is Signuperror) {
                // Remove loading dialog and show error
                Navigator.pop(context);
                showCustomSnackbar(
                    context, state.error, Colors.red, Colors.white);
              }
            },
          ),
        ],
        child: Signupwidget(
          formkey: formkey,
          emailcontroller: emailcontroller,
          passwordcontroller: passwordcontroller,
          namecontroller: namecontroller,
          confirmpasswordcontroller: confirmpasswordcontroller,
        ),
      ),
    );
  }
}
