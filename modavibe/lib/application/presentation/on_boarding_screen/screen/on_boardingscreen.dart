import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modavibe/application/presentation/on_boarding_screen/widget/action_slider_widget.dart';

class Onboarding extends StatelessWidget {
  Onboarding({super.key});

  final List<String> pages = [
    "assets/images/portrait-beautiful-pin-up-woman-studio-removebg-preview.png",
    "assets/images/onboardingscreen2-removebg-preview.png",
    "assets/images/young-smiling-man-red-shirt-with-optical-glasses-points-isolated-orange-wall-removebg-preview.png"
  ];
  final List<String> text = [
    "Welcome to ModaVibe",
    "Fit to Comfort",
    "Unleash Your Style Potential"
  ];

  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
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
                        height: 450,
                        width: 400,
                      ),
                    ),
                    Positioned(
                      bottom: pageIndex == pages.length - 1 ? 280 : 200,
                      left: 0,
                      right: 0,
                      child: Text(
                        text[pageIndex],
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.w600),
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
                    ? const Positioned(
                        bottom: 20,
                        left: 50,
                        right: 50,
                        child: Actionsliderwidge(),
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
