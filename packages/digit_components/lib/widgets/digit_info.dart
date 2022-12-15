import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

class DigitInfo extends StatelessWidget {
  final String title;
  final String description;
  final Color backgroundcolor;
  final IconData? icon;
  final Color? iconcolor;

  const DigitInfo(
      {super.key,
      required this.title,
      required this.description,
      required this.backgroundcolor,
      this.iconcolor,
      this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: DigitTheme.instance.containerMargin,
      padding: const EdgeInsets.all(8),
      color: backgroundcolor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(
                  icon,
                  color: iconcolor,
                ),
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
              )
            ],
          ),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
