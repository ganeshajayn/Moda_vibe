import 'package:flutter/material.dart';

class Searchbarwidget extends StatelessWidget {
  const Searchbarwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: TextField(
        decoration: InputDecoration(
            fillColor: Colors.white30,
            filled: true,
            labelText: "Search",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.deepPurple,
            ),
            suffixIcon: const Icon(
              Icons.filter_list_alt,
              color: Colors.deepPurple,
            )),
      ),
    );
  }
}
