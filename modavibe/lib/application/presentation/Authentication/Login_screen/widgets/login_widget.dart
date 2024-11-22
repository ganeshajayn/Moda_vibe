import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavibe/Domain/utils/elevatedbuttonWidget/elevatedbutton.dart';
import 'package:modavibe/Domain/utils/textformfieldWidget/textbuttonwidget.dart';
import 'package:modavibe/Domain/utils/textwidget/textwidget.dart';
import 'package:modavibe/application/bussineslogic/login/bloc/login_bloc.dart';
import 'package:modavibe/application/presentation/Authentication/Signup_screen/signup_screen.dart';

class UserloginWidget extends StatelessWidget {
  const UserloginWidget(
      {super.key,
      required this.emailcontroller,
      required this.passwordcontroller,
      required this.formkey});
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  final GlobalKey<FormState> formkey;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "E-mail is required";
                }
                final emailRegex = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  caseSensitive: false,
                  multiLine: false,
                );
                if (!emailRegex.hasMatch(value)) {
                  return "please entered a valid e-mail";
                }
                return null;
              },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password required";
                  }
                  return null;
                },
                obscuretext: true),
            const SizedBox(
              height: 50,
            ),
            ElevatedbuttonWidget(
                onpressed: () {
                  if (formkey.currentState!.validate()) {
                    BlocProvider.of<LoginBloc>(context).add(Loginbuttonpressed(
                        email: emailcontroller.text,
                        password: passwordcontroller.text));
                  }
                },
                width: 120,
                buttontext: "Log in"),
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
      ),
    );
  }
}
