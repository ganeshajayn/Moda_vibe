import 'package:flutter/material.dart';
import 'package:modavibe/Domain/utils/elevatedbuttonWidget/elevatedbutton.dart';
import 'package:modavibe/application/presentation/Authentication/Login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showCustomSnackbar(
    BuildContext context, String text, Color backgroundcolor, Color textcolor) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 3),
      content: Text(
        text,
        style: TextStyle(color: textcolor),
      ),
      backgroundColor: backgroundcolor,
    ),
  );
}

Future<void> userlogout(BuildContext context) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text("Are you sure you want logout?"),
          actions: [
            ElevatedbuttonWidget(
                onpressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('access token', '');
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                      (route) => false);
                },
                width: MediaQuery.sizeOf(context).width * 0.2,
                buttontext: 'Yes'),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('No'))
          ],
        );
      });
}
