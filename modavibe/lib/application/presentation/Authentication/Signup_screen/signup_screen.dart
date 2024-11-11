import 'package:flutter/material.dart';
import 'package:modavibe/application/presentation/Authentication/Signup_screen/widgets/signup_widget.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();

    TextEditingController emailcontroller = TextEditingController();
    TextEditingController passwordcontroller = TextEditingController();

    return Scaffold(
      body: Signupwidget(
        emailcontroller: emailcontroller,
        passwordcontroller: passwordcontroller,
        namecontroller: namecontroller,
      ),
    );
  }
}
