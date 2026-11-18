import 'package:flutter/material.dart';

/// Shows the app at phone size on wide screens, so reviewers see the layout
/// field workers see. The frame wraps the router's Navigator, so dialogs,
/// popups and bottom sheets stay inside it. On narrow screens (a real phone)
/// it does nothing. Open the preview with `?frame=off` for full width.
class PhoneFrame extends StatelessWidget {
  /// Logical size of a common Android phone (e.g. Pixel 7: 412 x 915).
  static const Size phoneSize = Size(412, 915);

  final Widget child;

  const PhoneFrame({super.key, required this.child});

  static bool get enabled => Uri.base.queryParameters['frame'] != 'off';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (!enabled || constraints.maxWidth < phoneSize.width + 48) {
        return child;
      }
      final height = (constraints.maxHeight - 32).clamp(480.0, phoneSize.height);
      final size = Size(phoneSize.width, height);
      final media = MediaQuery.of(context);
      return ColoredBox(
        color: const Color(0xFFE0E0E0),
        child: Center(
          child: Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: const Color(0xFF424242), width: 6),
              boxShadow: const [
                BoxShadow(blurRadius: 24, color: Color(0x33000000)),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: MediaQuery(
                // Widgets size themselves from MediaQuery; report the phone.
                data: media.copyWith(
                  size: Size(size.width - 12, size.height - 12),
                  padding: EdgeInsets.zero,
                  viewPadding: EdgeInsets.zero,
                ),
                child: child,
              ),
            ),
          ),
        ),
      );
    });
  }
}
