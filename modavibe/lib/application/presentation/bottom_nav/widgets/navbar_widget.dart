import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavibe/application/bussineslogic/bottomnavbar/bloc/navbar_bloc.dart';
import 'package:modavibe/application/bussineslogic/theme_bloc/bloc/theme_bloc.dart';

class Navwidget extends StatelessWidget {
  const Navwidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return BlocBuilder<ThemeBloc, Themestate>(
      builder: (context, state) {
        final isdarkmode = state.themeMode == ThemeMode.dark;
        return CurvedNavigationBar(
          color: isdarkmode ? Colors.black87 : Colors.deepPurple,
          backgroundColor: Colors.white,
          buttonBackgroundColor: isdarkmode ? Colors.black : Colors.white,
          animationCurve: Curves.easeInOutCubicEmphasized,
          height: height * 0.065,
          index: 1,
          items: [
            Icon(
              Icons.favorite,
              color: isdarkmode ? Colors.white : Colors.black,
            ),
            Icon(
              Icons.home,
              color: isdarkmode ? Colors.white : Colors.black,
            ),

            Icon(
              Icons.shopping_bag,
              color: isdarkmode ? Colors.white : Colors.black,
            ),
            //Icon(Icons.settings),
          ],
          animationDuration: const Duration(milliseconds: 300),
          onTap: (value) {
            final bloc = context.read<NavbarBloc>();
            switch (value) {
              case 0:
                bloc.add(Categoriespressed());
              case 1:
                bloc.add(Homepressed());
              case 2:
                bloc.add(Cartpressed());
              // case 3:
              //   bloc.add(Settingpressed());
            }
          },
        );
      },
    );
  }
}
