import 'package:flutter/material.dart';

class DigitSearchBar extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const DigitSearchBar({super.key, this.padding, this.margin});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.white70, width: 1),
          borderRadius: BorderRadius.circular(32),
        ),
        margin: margin,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter the name of household head',
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(color: Colors.white),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    const BorderSide(color: Color.fromARGB(255, 255, 253, 253)),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        ));
  }
}
