import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubHeadingTextWidget extends StatelessWidget {
  const SubHeadingTextWidget({
    super.key,
    required this.title,
    this.textColor,
    this.textsize,
  });
  final String title;
  final Color? textColor;
  final double? textsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: textsize ?? 16,
        fontWeight: FontWeight.w600,
        color: textColor,
      ),
    );
  }
}

class Colorwidget extends StatelessWidget {
  const Colorwidget(
      {super.key, required this.title, this.textcolor, this.textsize});
  final String title;
  final Color? textcolor;
  final double? textsize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.openSans(
          color: textcolor,
          fontSize: textsize ?? 16,
          fontWeight: FontWeight.w700),
    );
  }
}
