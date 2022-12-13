import 'package:flutter/material.dart';

class DigitBanner extends StatelessWidget {
  final Widget child;
  final Color color;
  final String imgUrl;

  const DigitBanner({
    super.key,
    required this.child,
    required this.color,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: color,
          image: DecorationImage(
            image: NetworkImage(
              imgUrl,
            ),
            fit: BoxFit.cover,
            opacity: .2,
          ),
        ),
        child: child);
  }
}
