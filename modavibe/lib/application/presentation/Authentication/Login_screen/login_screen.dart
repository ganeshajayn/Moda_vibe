import 'package:flutter/material.dart';
import 'package:modavibe/application/presentation/Authentication/Login_screen/widgets/login_Widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailcontroller = TextEditingController();
    final TextEditingController passwordcontroller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: UserloginWidget(
            emailcontroller: emailcontroller,
            passwordcontroller: passwordcontroller),
      ),
    );
  }
}
