import 'package:digit_ui_components/digit_components.dart';
import 'package:flutter/material.dart';

class FileTransferAnimation extends StatefulWidget {
  @override
  _FileTransferAnimationState createState() => _FileTransferAnimationState();
}

class _FileTransferAnimationState extends State<FileTransferAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(); // Repeat animation indefinitely

    // Define the animation (from 0 to 1)
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    // Dispose of the controller to avoid memory leaks
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Animation widget
    return SizedBox(
      height: 100,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Static Phone Icons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.smartphone,
                  size: 50, color: DigitTheme.instance.colors.light.primary2),
              const SizedBox(width: 100), // Distance between the two phones
              Icon(Icons.smartphone,
                  size: 50, color: DigitTheme.instance.colors.light.primary2),
            ],
          ),
          // Moving file icon
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Positioned(
                left: 50.0 +
                    (_animation.value *
                        100), // Move horizontally between phones
                child: Icon(
                  Icons.insert_drive_file,
                  size: 24,
                  color: DigitTheme.instance.colors.light.textSecondary,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
