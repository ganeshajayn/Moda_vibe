import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavibe/application/bussineslogic/login/bloc/login_bloc.dart';
import 'package:modavibe/application/bussineslogic/signup/bloc/signup_bloc.dart';
import 'package:modavibe/application/presentation/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LoginBloc(),
        ),
        BlocProvider(
          create: (_) => SignupBloc(),
        )
      ],
      child: const MaterialApp(
        home: Splashscreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
