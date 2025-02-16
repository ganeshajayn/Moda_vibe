import 'package:flutter/material.dart';
import 'package:modavibe/Domain/utils/elevatedbuttonWidget/elevatedbutton.dart';
import 'package:modavibe/Domain/utils/functions/functions.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Center(
        child: ElevatedbuttonWidget(
            onpressed: () {
              userlogout(context);
            },
            width: screenwidth * 0.5,
            buttontext: 'logout'),
      ),
    );
  }
}
