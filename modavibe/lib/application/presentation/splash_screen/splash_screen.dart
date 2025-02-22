// ignore_for_file: use_build_context_synchronously

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavibe/Data/sharedpreferences/shared_preferences.dart';
import 'package:modavibe/application/bussineslogic/splash/bloc/splash_bloc.dart';
import 'package:modavibe/application/presentation/bottom_nav/bottom_nav.dart';

import 'package:modavibe/application/presentation/on_boarding_screen/screen/on_boardingscreen.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        backgroundColor: Colors.white,
        splash: Image.asset(
            "assets/images/freepik__candid-image-photography-natural-textures-highly-r__75557-removebg-preview (1).png"),
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
                        builder: (context) => const Bottomnavbar(),
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
