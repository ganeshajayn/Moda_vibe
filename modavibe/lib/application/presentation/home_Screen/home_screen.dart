import 'package:flutter/material.dart';
import 'package:modavibe/Domain/utils/textwidget/textwidget.dart';
import 'package:modavibe/application/presentation/home_Screen/widget/apphome.dart';
import 'package:modavibe/application/presentation/home_Screen/widget/carouse_slider.dart';
import 'package:modavibe/application/presentation/home_Screen/widget/searchbar.dart';
import 'package:modavibe/application/presentation/home_Screen/widget/slided_screen.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDarkMode ? Colors.white : Colors.black87;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenHeight * 0.07),
        child: const Homewidget(),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align widgets to the left
          children: [
            Searchbarwidget(),
            Carousel(
              radius: 50,
            ),
            SizedBox(height: 20),
            Sliderscreen(),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
