import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:modavibe/application/presentation/on_boarding_screen/screen/on_boardingscreen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.white,
        splash: Image.asset("assets/images/Untitled design (5).png"),
        splashIconSize: 500,
        duration: 2000,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: Onboarding());
  }
}
