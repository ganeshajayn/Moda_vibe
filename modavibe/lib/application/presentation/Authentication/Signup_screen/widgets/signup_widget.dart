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
      required this.confirmpasswordcontroller,
      required this.phonenumbercontroller});

  final TextEditingController namecontroller;
  final GlobalKey<FormState> formkey;
  final TextEditingController emailcontroller;
  final TextEditingController passwordcontroller;
  final TextEditingController confirmpasswordcontroller;
  final TextEditingController phonenumbercontroller;

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Scaled image based on screen size
            Image.asset(
              "assets/images/freepik__candid-image-photography-natural-textures-highly-r__75557-removebg-preview (1).png",
              height: screenHeight * 0.3, // 30% of screen height
              width: screenWidth * 0.5, // 80% of screen width
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Colorwidget(
                  title: "Create \nan account!",
                  textsize: screenWidth *
                      0.1, // Adjust text size based on screen width
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.05), // Responsive spacing

            // Name input field
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
                    return "Name must be longer than 3 characters";
                  }
                  return null;
                },
                obscuretext: false),
            SizedBox(height: screenHeight * 0.03), // Responsive spacing

            // Email input field
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
                  if (!emailRegex.hasMatch(value)) {
                    return "Please enter a valid e-mail";
                  }
                  return null;
                },
                obscuretext: false),
            SizedBox(height: screenHeight * 0.03), // Responsive spacing

            // Password input field
            TextbuttonWidget(
                controller: passwordcontroller,
                hinttext: "New Password",
                labeltext: "New Password",
                iconData: Icons.security,
                suffixicon: Icons.visibility_off,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password is required";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
                obscuretext: true),
            SizedBox(height: screenHeight * 0.03), // Responsive spacing

            // Confirm Password input field
            TextbuttonWidget(
                controller: confirmpasswordcontroller,
                hinttext: "Confirm Password",
                labeltext: "Confirm Password",
                iconData: Icons.security,
                suffixicon: Icons.visibility_off,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Confirm password is required";
                  }
                  if (value != passwordcontroller.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
                obscuretext: true),
            SizedBox(height: screenHeight * 0.03), // Responsive spacing

            // Phone input field
            TextbuttonWidget(
                controller: phonenumbercontroller,
                hinttext: 'Enter your Phone Number',
                labeltext: 'Phone',
                iconData: Icons.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Phone number is required";
                  }
                  if (value.length < 3) {
                    return "Please enter a valid phone number";
                  }
                  return null;
                },
                obscuretext: false),
            SizedBox(height: screenHeight * 0.03), // Responsive spacing

            // Sign Up button
            ElevatedbuttonWidget(
                onpressed: () {
                  if (formkey.currentState!.validate()) {
                    BlocProvider.of<SignupBloc>(context).add(
                        Signupbuttonpressed(
                            phonenumber: phonenumbercontroller.text,
                            email: emailcontroller.text,
                            name: namecontroller.text,
                            password: passwordcontroller.text,
                            confirmpassword: confirmpasswordcontroller.text));
                  }
                },
                width:
                    screenWidth * 0.5, // 50% of screen width for button width
                buttontext: "Sign Up"),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing

            // Navigate to Login screen if already registered
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                child: const Colorwidget(
                  title: "Already registered? Sign In",
                  textcolor: Colors.deepPurple,
                )),
          ],
        ),
      ),
    );
  }
}
