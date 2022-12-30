import 'package:digit_components/theme/digit_theme.dart';
import 'package:flutter/material.dart';

class DigitInfoCard extends StatelessWidget {
  final String title;
  final String description;
  final Color backgroundcolor;
  final IconData? icon;
  final Color? iconcolor;
  final EdgeInsets? padding;

  const DigitInfoCard({
    super.key,
    required this.title,
    required this.description,
    required this.backgroundcolor,
    this.iconcolor,
    this.icon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: DigitTheme.instance.containerMargin,
      padding: padding ?? const EdgeInsets.all(8),
      color: backgroundcolor,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: padding ?? const EdgeInsets.all(8),
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
