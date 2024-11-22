import 'package:flutter/material.dart';

class TextbuttonWidget extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? suffixicon;
  final String hinttext;
  final String labeltext;
  final TextInputType? textInputType;
  final bool obscuretext;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onchanged;
  final IconData? iconData;

  const TextbuttonWidget(
      {super.key,
      this.controller,
      required this.hinttext,
      required this.labeltext,
      this.textInputType,
      required this.obscuretext,
      this.validator,
      this.onchanged,
      this.iconData,
      this.suffixicon});

  @override
  Widget build(BuildContext context) {
    // Get the screen width for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screeewheight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        //    color: const Color.fromARGB(255, 255, 253, 253),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 169, 167, 167).withOpacity(0.5),
            spreadRadius: 1,
            offset: const Offset(0, 0),
            blurRadius: 0,
          ),
        ],
      ),
      height: screeewheight * 0.056,
      width: screenWidth * 0.8, // 80% of screen width
      child: TextFormField(
        controller: controller,
        obscureText: obscuretext,
        validator: validator,
        onChanged: onchanged,
        keyboardType: textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          label: Text(
            labeltext,
            style: const TextStyle(color: Colors.black, fontSize: 16),
          ),
          hintText: hinttext,
          hintStyle:
              const TextStyle(color: Colors.grey), // Adjust hint text color
          prefixIcon: iconData != null
              ? Icon(
                  iconData,
                  color: Colors.black,
                )
              : null,
          suffixIcon: suffixicon != null
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    suffixicon,
                    color: Colors.black,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15), // Adjust vertical padding
          border: InputBorder.none,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          fillColor: const Color.fromARGB(255, 213, 211, 211),
          filled: true,
        ),
      ),
    );
  }
}
