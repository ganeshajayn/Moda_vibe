import 'package:flutter/material.dart';
import 'package:modavibe/Domain/utils/textwidget/textwidget.dart';

class ElevatedbuttonWidget extends StatelessWidget {
  const ElevatedbuttonWidget(
      {super.key,
      required this.onpressed,
      required this.width,
      this.textsize,
      required this.buttontext});
  final void Function() onpressed;
  final double width;
  final double? textsize;
  final String buttontext;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
          onPressed: onpressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SubHeadingTextWidget(
              title: buttontext,
              textsize: textsize ?? 14,
              textColor: Colors.white,
            ),
          )),
    );
  }
}
