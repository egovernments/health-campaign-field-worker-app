import 'package:flutter/material.dart';

class DigitIconTile extends StatelessWidget {
  final String title;
  final Widget? content;
  final IconData? icon;
  final VoidCallback onPressed;

  const DigitIconTile({
    super.key,
    required this.title,
    this.content,
    this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
      ),
      title: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
          ),
          content ??
              const SizedBox(
                width: 0,
                height: 0,
              )
        ],
      ),
      onTap: onPressed,
    );
  }
}
