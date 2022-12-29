import 'package:flutter/material.dart';

class DigitTableItem extends StatelessWidget {
  final double? width;
  final double? height;
  final String content;
  final int index;
  final Widget? child;
  final bool? isColored;

  const DigitTableItem(
      {super.key,
      this.width,
      this.height,
      required this.content,
      required this.index,
      this.child,
      this.isColored});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isColored != null
          ? index % 2 == 0
              ? const Color(0xffEEEEEE)
              : Colors.white
          : null,
      width: width ?? 100,
      height: height ?? 50,
      padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: child ?? Text(content),
    );
  }
}
