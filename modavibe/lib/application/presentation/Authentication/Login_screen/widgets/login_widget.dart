import 'package:flutter/material.dart';
import 'package:modavibe/Domain/utils/elevatedbuttonWidget/elevatedbutton.dart';
import 'package:modavibe/Domain/utils/textformfieldWidget/textbuttonwidget.dart';
import 'package:modavibe/Domain/utils/textwidget/textwidget.dart';
import 'package:modavibe/application/presentation/Authentication/Signup_screen/signup_screen.dart';

class UserloginWidget extends StatelessWidget {
  const UserloginWidget(
      {super.key,
      required this.emailcontroller,
      required this.passwordcontroller});
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/Untitled design (5).png",
            height: 380,
            width: 450,
          ),
          TextbuttonWidget(
            controller: emailcontroller,
            hinttext: "Please enter the email ",
            labeltext: "E-mail",
            obscuretext: false,
            iconData: Icons.email,
          ),
          const SizedBox(
            height: 40,
          ),
          TextbuttonWidget(
              controller: passwordcontroller,
              iconData: Icons.fingerprint,
              hinttext: "Enter the password",
              labeltext: "Password",
              textInputType: TextInputType.emailAddress,
              suffixicon: Icons.visibility_off,
              obscuretext: true),
          const SizedBox(
            height: 50,
          ),
          ElevatedbuttonWidget(
              onpressed: () {}, width: 120, buttontext: "Log in"),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Signupscreen(),
                ));
              },
              child: const Colorwidget(
                title: "New User ? Register here",
                textcolor: Colors.black,
                textsize: 15,
              )),
        ],
      ),
    );
  }
}
