import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavibe/Data/api/categoryrepo/categoryrepo.dart';
import 'package:modavibe/application/bussineslogic/bottomnavbar/bloc/navbar_bloc.dart';
import 'package:modavibe/application/bussineslogic/category/category_bloc.dart';
import 'package:modavibe/application/bussineslogic/login/bloc/login_bloc.dart';
import 'package:modavibe/application/bussineslogic/signup/bloc/signup_bloc.dart';
import 'package:modavibe/application/bussineslogic/splash/bloc/splash_bloc.dart';
import 'package:modavibe/application/bussineslogic/theme_bloc/bloc/theme_bloc.dart';
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
        ),
        BlocProvider(
          create: (_) => SplashBloc(),
        ),
        BlocProvider(
          create: (_) => NavbarBloc(),
        ),
        BlocProvider(create: (context) => ThemeBloc()),
        BlocProvider(create: (_) => CategoryBloc(Categoryrepository())),
      ],
      child: BlocBuilder<ThemeBloc, Themestate>(
        builder: (context, themestate) {
          return MaterialApp(
            theme: ThemeData.light(),
            darkTheme: ThemeData.dark(useMaterial3: true),
            home: const Splashscreen(),
            debugShowCheckedModeBanner: false,
            themeMode: themestate.themeMode,
          );
        },
      ),
    );
  }
}
