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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align widgets to the left
          children: [
            const Searchbarwidget(),
            const Carousel(
              radius: 50,
              colors: [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.deepPurple,
                Colors.deepOrange,
                Colors.tealAccent,
              ],
              text: [
                "Mens",
                "Womens",
                "Kids",
                "Girls",
                "Boys",
                "Gents",
                "Ladies",
              ],
            ),
            const SizedBox(height: 20),
            const Sliderscreen(),
            const SizedBox(height: 30),
            Padding(
              padding:
                  EdgeInsets.only(left: screenWidth * 0.05), // Dynamic padding
              child: Colorwidget(
                title: "Popular brands",
                textsize: 22,
                fontWeight: FontWeight.w500,
                textcolor: textColor,
              ),
            ),
            const SizedBox(height: 0),
            const Carousel(
              radius: 35,
              colors: [
                Colors.red,
                Colors.blue,
                Colors.green,
                Colors.yellow,
                Colors.deepPurple,
                Colors.deepOrange,
                Colors.tealAccent,
              ],
              text: [
                "Allen Solly",
                "Rare Rabbit",
                "Peter England",
                "Poland",
                "Boys",
                "Gents",
                "Ladies",
              ],
            ),
            Padding(
              padding:
                  EdgeInsets.only(left: screenWidth * 0.05), // Dynamic padding
              child: Colorwidget(
                title: "Mens",
                textsize: 22,
                fontWeight: FontWeight.w500,
                textcolor: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
