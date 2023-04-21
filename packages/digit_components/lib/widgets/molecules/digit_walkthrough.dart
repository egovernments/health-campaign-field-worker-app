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
  late double childHeight;
  late double childWidth;
  late Offset position;

  DigitWalkthroughState(
      {this.position = Offset.zero,
      this.childHeight = 0.0,
      this.childWidth = 0.0}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initOffsetsPositions();
    });
  }

  OverlayWidgetState? get overlayWidgetController {
    return widget.overlayWidget.currentState;
  }

  OverlayWidgetState? get overlayFullscreenController {
    return _overlayFullscreen.currentState;
  }

  void initOffsetsPositions() {
    Offset position =
        ((widget.overlayWidget).currentContext?.findRenderObject() as RenderBox)
            .localToGlobal(Offset.zero);
    this.childHeight = (widget.overlayWidget).currentContext!.size!.height / 2;
    this.childWidth = (widget.overlayWidget).currentContext!.size!.width;

    this.position = position;
  }

  void onButtonTap() {
    overlayWidgetController?.toggle();
    overlayFullscreenController?.toggle();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            )));
  }
}
