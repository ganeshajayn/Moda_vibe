import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextbuttonWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hinttext;
  final String labeltext;
  final TextInputType? textInputType;
  final bool obscuretext;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onchanged;
  final IconData? iconData;
  const TextbuttonWidget(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.labeltext,
      this.textInputType,
      required this.obscuretext,
      this.validator,
      this.onchanged,
      this.iconData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 253, 253),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color:
                    const Color.fromARGB(255, 169, 167, 167).withOpacity(0.5),
                spreadRadius: 1,
                offset: const Offset(2, 2),
                blurRadius: 5),
          ]),
      height: 60,
      width: 380,
      child: TextFormField(
        controller: controller,
        obscureText: obscuretext,
        validator: validator,
        onChanged: onchanged,
        decoration: InputDecoration(
            label: Text(
              labeltext,
              style: GoogleFonts.poppins(color: Colors.black),
            ),
            hintText: hinttext,
            prefixIcon: iconData != null
                ? Icon(
                    iconData,
                    color: Colors.black,
                  )
                : null,
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent)),
            //UnderlineInputBorder(borderRadius: BorderRadius.circular(20)),

            fillColor: const Color.fromARGB(255, 213, 211, 211),
            filled: true),
      ),
    );
  }
}
