import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Sliderscreen extends StatelessWidget {
  const Sliderscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screeheight = MediaQuery.sizeOf(context).height;
    final screenwidth = MediaQuery.sizeOf(context).width;
    return CarouselSlider(
        items: [
          carouselitem(Colors.red),
          carouselitem(Colors.blue),
          carouselitem(Colors.green)
        ],
        options: CarouselOptions(
            height: screeheight * 0.25,
            aspectRatio: 16 / 9,
            viewportFraction: 0.9,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(
              seconds: 3,
            ),
            autoPlayCurve: Curves.bounceOut,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal));
  }
}

Widget carouselitem(Color color) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(2, 2))
        ]),
  );
}
