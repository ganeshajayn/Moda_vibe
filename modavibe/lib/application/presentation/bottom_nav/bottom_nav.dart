import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavibe/application/bussineslogic/bottomnavbar/bloc/navbar_bloc.dart';
import 'package:modavibe/application/presentation/bottom_nav/widgets/navbar_widget.dart';
import 'package:modavibe/application/presentation/cart_screen/cart_screen.dart';
import 'package:modavibe/application/presentation/favourites/favourite_screen.dart';
import 'package:modavibe/application/presentation/home_Screen/home_screen.dart';

class Bottomnavbar extends StatelessWidget {
  const Bottomnavbar({super.key});

  @override
  Widget build(BuildContext context) {
    // final List<Widget> screens = [
    //   const Homescreen(),
    //   const Favouritescreen(),
    //   const Cartscreen(),
    //   const Settingscreen(),
    // ];
    return BlocProvider(
      create: (context) => NavbarBloc(),
      child: BlocBuilder<NavbarBloc, NavbarState>(
        builder: (context, state) {
          Widget currentscreen = const Homescreen();
          if (state is Homeselected) {
            currentscreen = const Homescreen();
          } else if (state is Categoriesselected) {
            currentscreen = const Favouritescreen();
          } else if (state is Cartselected) {
            currentscreen = const Cartscreen();
            // } else if (state is Settingselected) {
            //   currentscreen = const Settingscreen();
          }
          return Scaffold(
            body: currentscreen,
            backgroundColor: Colors.deepPurple,
            bottomNavigationBar: const Navwidget(),
          );
        },
      ),
    );
  }
}
