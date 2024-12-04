import 'package:flutter/material.dart';

class Carousel extends StatelessWidget {
  const Carousel(
      {super.key,
      required this.colors,
      required this.text,
      required this.radius});
  final List<Color> colors;
  final List<String> text;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: colors.length,
          itemBuilder: (BuildContext context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: radius,
                      backgroundColor: colors[index],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(text[index])
                  ]),
            );
          }),
    );
  }
}
