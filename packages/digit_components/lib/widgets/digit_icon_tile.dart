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
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: content ?? const Offstage(),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
