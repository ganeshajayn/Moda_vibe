import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loadinganimationstagger extends StatelessWidget {
  const Loadinganimationstagger({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.blue, size: 40),
    );
  }
}

class Threedotanimation extends StatelessWidget {
  const Threedotanimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeRotatingDots(
          color: Colors.blue, size: 30),
    );
  }
}
