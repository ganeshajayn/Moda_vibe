import 'package:flutter/material.dart';
import 'package:modavibe/Domain/utils/elevatedbuttonWidget/elevatedbutton.dart';
import 'package:modavibe/Domain/utils/textformfieldWidget/textbuttonwidget.dart';
import 'package:modavibe/Domain/utils/textwidget/textwidget.dart';
import 'package:modavibe/application/presentation/Authentication/Login_screen/login_screen.dart';

class Signupwidget extends StatelessWidget {
  const Signupwidget(
      {super.key,
      required this.namecontroller,
      required this.emailcontroller,
      required this.passwordcontroller});
  final TextEditingController namecontroller;

  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/freepik__candid-image-photography-natural-textures-highly-r__70051.jpeg",
            height: 380,
            width: 450,
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Colorwidget(
                title: "Create \nan account!",
                textsize: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          TextbuttonWidget(
              iconData: Icons.person,
              controller: namecontroller,
              hinttext: "Enter your name",
              labeltext: "Full Name",
              obscuretext: false),
          const SizedBox(
            height: 20,
          ),
          TextbuttonWidget(
              controller: emailcontroller,
              iconData: Icons.email,
              hinttext: "Enter your e-mail",
              labeltext: "E-mail",
              obscuretext: false),
          const SizedBox(
            height: 20,
          ),
          TextbuttonWidget(
              controller: passwordcontroller,
              hinttext: "New Password",
              labeltext: "Newpassword",
              iconData: Icons.security,
              suffixicon: Icons.visibility_off,
              obscuretext: true),
          const SizedBox(
            height: 20,
          ),
          const TextbuttonWidget(
              hinttext: "Confirm Password",
              labeltext: "Confirm Password",
              iconData: Icons.security,
              suffixicon: Icons.visibility_off,
              obscuretext: true),
          const SizedBox(
            height: 20,
          ),
          ElevatedbuttonWidget(
              onpressed: () {}, width: 130, buttontext: "Sign Up"),
          const SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: const Colorwidget(
                title: "Already register?Sign Up",
                textcolor: Colors.black,
              ))
        ],
      ),
    );
  }
}
