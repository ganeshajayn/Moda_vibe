import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavibe/Data/sharedpreferences/shared_preferences.dart';
import 'package:modavibe/application/bussineslogic/splash/bloc/splash_bloc.dart';
import 'package:modavibe/application/presentation/home_Screen/home_screen.dart';

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
        nextScreen: BlocProvider<SplashBloc>(
          create: (context) => SplashBloc()..add(Setsplash()),
          child: BlocConsumer<SplashBloc, SplashState>(
            listener: (context, state) async {
              if (state is Splashloadedstate) {
                final userloggintoken = await gettoken();
                if (userloggintoken == "") {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Onboarding(),
                      ),
                      (route) => false);
                } else {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Homescreen(),
                      ),
                      (route) => false);
                }
              }
            },
            builder: (context, state) {
              return Container();
            },
          ),
        ));
  }
}
