import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modavibe/Domain/utils/appbarwidget/app_bar.dart';
import 'package:modavibe/application/bussineslogic/theme_bloc/bloc/theme_bloc.dart';

class Homewidget extends StatelessWidget {
  const Homewidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.07),
        child: BlocBuilder<ThemeBloc, Themestate>(
          builder: (context, themeState) {
            final isDarkMode = themeState.themeMode == ThemeMode.dark;

            return Appbarwidget(
              tittle: Row(
                children: [
                  const Icon(Icons.light_mode),
                  Switch(
                    value: isDarkMode,
                    onChanged: (value) {
                      context.read<ThemeBloc>().add(Toggleevent());
                    },
                  ),
                  const Icon(Icons.dark_mode),
                ],
              ),
              centretitle: true,
              foregroundcolor: Colors.deepPurple,
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: isDarkMode ? Colors.white : Colors.deepPurple,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: isDarkMode ? Colors.white : Colors.deepPurple,
                  ),
                ),
              ],
              backgroundcolor: isDarkMode ? Colors.black12 : Colors.white,
            );
          },
        ),
      ),
    );
  }
}
