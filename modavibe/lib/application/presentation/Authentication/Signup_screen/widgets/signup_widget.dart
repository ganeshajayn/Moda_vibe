import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavibe/Domain/utils/elevatedbuttonWidget/elevatedbutton.dart';
import 'package:modavibe/Domain/utils/textformfieldWidget/textbuttonwidget.dart';
import 'package:modavibe/Domain/utils/textwidget/textwidget.dart';
import 'package:modavibe/application/bussineslogic/signup/bloc/signup_bloc.dart';
import 'package:modavibe/application/presentation/Authentication/Login_screen/login_screen.dart';

class Signupwidget extends StatelessWidget {
  const Signupwidget(
      {super.key,
      required this.namecontroller,
      required this.emailcontroller,
      required this.passwordcontroller,
      required this.formkey,
      required this.confirmpasswordcontroller});
  final TextEditingController namecontroller;
  final GlobalKey<FormState> formkey;
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  final TextEditingController confirmpasswordcontroller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name is required";
                  }
                  if (value.length < 3) {
                    return "Name contain more than 3 letters ";
                  }
                  return null;
                },
                obscuretext: false),
            const SizedBox(
              height: 20,
            ),
            TextbuttonWidget(
                controller: emailcontroller,
                iconData: Icons.email,
                hinttext: "Enter your e-mail",
                labeltext: "E-mail",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "E-mail is required";
                  }
                  final emailRegex = RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    caseSensitive: false,
                    multiLine: false,
                  );
                  if (emailRegex.hasMatch(value)) {
                    return "please enter valid e-mail";
                  }
                  return null;
                },
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
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "password required";
                  }
                  if (value.length < 6) {
                    return "Required atleast 6 characters";
                  }
                  return null;
                },
                obscuretext: true),
            const SizedBox(
              height: 20,
            ),
            TextbuttonWidget(
                controller: confirmpasswordcontroller,
                hinttext: "Confirm Password",
                labeltext: "Confirm Password",
                iconData: Icons.security,
                suffixicon: Icons.visibility_off,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "confirmpassword is required";
                  }
                  if (value != passwordcontroller.text) {
                    return "password does not match";
                  }
                  return null;
                },
                obscuretext: true),
            const SizedBox(
              height: 20,
            ),
            ElevatedbuttonWidget(
                onpressed: () {
                  if (formkey.currentState!.validate()) {
                    BlocProvider.of<SignupBloc>(context).add(
                        Signupbuttonpressed(
                            email: emailcontroller.text,
                            name: namecontroller.text,
                            password: passwordcontroller.text,
                            confirmpassword: confirmpasswordcontroller.text));
                  }
                },
                width: 130,
                buttontext: "Sign Up"),
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
      ),
    );
  }
}
