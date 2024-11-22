import 'package:flutter/material.dart';
import 'package:modavibe/Domain/utils/elevatedbuttonWidget/elevatedbutton.dart';
import 'package:modavibe/Domain/utils/functions/functions.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidht = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: ElevatedbuttonWidget(
            onpressed: () {
              userlogout(context);
            },
            width: screenwidht * 0.5,
            buttontext: 'logout'),
      ),
    );
  }
}
