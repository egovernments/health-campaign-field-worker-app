import 'package:digit_components/widgets/atoms/anchor_overlay.dart';
import 'package:flutter/material.dart';
import 'package:overlay_builder/overlay_builder.dart';

class DigitWalkthrough extends StatefulWidget {
  final Widget child;
  final String? title;
  final GlobalKey<OverlayWidgetState> overlayWidget;
  final TextAlign titleAlignment;
  final String description;
  final VoidCallback onTap;
  final VoidCallback onSkip;
  final double widgetHeight;

  const DigitWalkthrough({
    super.key,
    required this.child,
    required this.overlayWidget,
    this.title,
    required this.titleAlignment,
    required this.description,
    required this.onTap,
    required this.onSkip,
    required this.widgetHeight,
  });

  @override
  State<DigitWalkthrough> createState() => DigitWalkthroughState();
}

class DigitWalkthroughState extends State<DigitWalkthrough> {
  final _overlayFullscreen = GlobalKey<OverlayWidgetState>();

  bool showOverlay = false;
  double childHeight = 0.0;
  double childWidth = 0.0;
  Offset position = Offset.zero;

  OverlayWidgetState? get overlayWidgetController {
    return widget.overlayWidget.currentState;
  }

  OverlayWidgetState? get overlayFullscreenController {
    return _overlayFullscreen.currentState;
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      initOffsetsPositions();
    });
    super.initState();
  }

  void initOffsetsPositions() {
    final overlayContext = widget.overlayWidget.currentContext;
    if (overlayContext == null) return;

    final renderBox = overlayContext.findRenderObject();
    if (renderBox is! RenderBox) return;

    Offset position = renderBox.localToGlobal(Offset.zero);
    final size = overlayContext.size ?? Size.zero;
    childHeight = size.height / 2;
    childWidth = size.width;

    this.position = position;
  }

  void onButtonTap() {
    overlayWidgetController?.toggle();
    overlayFullscreenController?.toggle();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: widget.widgetHeight,
        child: AnchoredOverlay(
          showOverlay: showOverlay,
          description: widget.description,
          paramKey: widget.overlayWidget,
          onTap: widget.onTap,
          onSkip: widget.onSkip,
          position: position,
          childHeight: childHeight,
          childWidth: childWidth,
          child: IgnorePointer(
            ignoring: showOverlay,
            child: widget.child,
          ),
        ),
      );
}
