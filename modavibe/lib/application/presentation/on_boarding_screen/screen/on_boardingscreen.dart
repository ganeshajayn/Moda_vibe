import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:modavibe/application/presentation/on_boarding_screen/widget/action_slider_widget.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final List<String> pages = [
    "assets/images/portrait-beautiful-pin-up-woman-studio-removebg-preview.png",
    "assets/images/onboardingscreen2-removebg-preview.png",
    "assets/images/young-smiling-man-red-shirt-with-optical-glasses-points-isolated-orange-wall-removebg-preview.png"
  ];

  final List<String> text = [
    "Welcome to Style Laura",
    "Fit to Comfort",
    "Unleash Your Style Potential"
  ];

  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    // Get the screen size using MediaQuery
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            ConcentricPageView(
              pageController: _pageController,
              onChange: (index) {
                _currentIndexNotifier.value = index;
              },
              itemCount: 3,
              itemBuilder: (index) {
                int pageIndex = index % pages.length;
                String imagePath = pages[pageIndex];

                return Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        imagePath,
                        height: screenHeight *
                            0.4, // Use a fraction of the screen height
                        width: screenWidth *
                            0.8, // Use a fraction of the screen width
                      ),
                    ),
                    Positioned(
                      bottom: pageIndex == pages.length - 1
                          ? screenHeight *
                              0.3 // Adjust bottom based on screen size
                          : screenHeight * 0.2,
                      left: 0,
                      right: 0,
                      child: Text(
                        text[pageIndex],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth *
                              0.05, // Font size as a fraction of screen width
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                );
              },
              reverse: false,
              radius: 0,
              colors: const [Colors.blue, Colors.green, Colors.orange],
            ),
            ValueListenableBuilder<int>(
              valueListenable: _currentIndexNotifier,
              builder: (context, currentIndex, child) {
                return currentIndex == pages.length - 1
                    ? Positioned(
                        bottom: screenHeight *
                            0.05, // Adjust bottom for action slider
                        left: screenWidth * 0.1, // Adjust width
                        right: screenWidth * 0.1,
                        child: const Actionsliderwidge(),
                      )
                    : const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
