import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:modavibe/application/presentation/Authentication/Login_screen/login_screen.dart';

class Actionsliderwidge extends StatelessWidget {
  const Actionsliderwidge({super.key});

  @override
  Widget build(BuildContext context) {
    return ActionSlider.standard(
      toggleColor: Colors.blueAccent,
      backgroundBorderRadius: BorderRadius.circular(35),
      action: ((controller) async {
        controller.loading();
        await Future.delayed(const Duration(seconds: 3));
        controller.success();
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ));
      }),
      child: const Text(
        "Slide to Confirm",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
