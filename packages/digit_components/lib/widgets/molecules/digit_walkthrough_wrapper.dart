import 'package:digit_components/widgets/atoms/anchor_overlay.dart';
import 'package:flutter/material.dart';
import 'package:overlay_builder/overlay_builder.dart';

import 'digit_walkthrough.dart';

class DigitWalkthroughWrapper extends StatefulWidget {
  final Widget child;

  final List<GlobalKey> keysArray;
  final GlobalKey<OverlayWidgetState> overlayWidget;
  final List<GlobalKey<DigitWalkthroughState>> widgetKey;

  const DigitWalkthroughWrapper({
    super.key,
    required this.child,
    required this.overlayWidget,
    required this.keysArray,
    required this.widgetKey,
  });
  @override
  State<StatefulWidget> createState() {
    return DigitWalkthroughWrapperState();
  }
}

class DigitWalkthroughWrapperState extends State<DigitWalkthroughWrapper> {
  bool showOverlay = false;
  GlobalKey<OverlayWidgetState> overlaykey =
      GlobalKey(debugLabel: 'Digit-Wrapper');
  int index = 0;

  OverlayWidgetState? get overlayWidgetController {
    return widget.overlayWidget.currentState;
  }

  void onSelectedTap() {
    if (widget.keysArray.length == index) {
      widget.widgetKey[index - 1].currentState?.setState(() {
        widget.widgetKey[index - 1].currentState?.showOverlay = false;
      });
      widget.widgetKey[index - 1].currentState?.onButtonTap();
      setState(() {
        index = 0;
      });
    } else {
      if (index > 0) {
        widget.widgetKey[index - 1].currentState?.onButtonTap();
        widget.widgetKey[index - 1].currentState?.setState(() {
          widget.widgetKey[index - 1].currentState?.showOverlay = false;
        });
      }
      widget.widgetKey[index].currentState?.onButtonTap();

      widget.widgetKey[index].currentState?.setState(() {
        widget.widgetKey[index].currentState?.showOverlay = true;
      });
      setState(() {
        index = index + 1;
      });
    }
  }

  void onSelectedSkip() {
    widget.widgetKey[index - 1].currentState?.setState(() {
      widget.widgetKey[index - 1].currentState?.showOverlay = false;
    });
    widget.widgetKey[index - 1].currentState?.onButtonTap();
    setState(() {
      index = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return OverlayBuilder(
      type: OverlayType.fullscreen,
      opaque: true,
      key: overlaykey,
      overlayChild: widget.child,
      child: Material(
        elevation: 6,
        type: MaterialType.transparency,
        child: widget.child,
      ),

      // : GestureDetector(
      // onTap: () {
      //   setState(() {
      //     showOverlay = true;
      //   });
      //   widget.widgetKey[index].currentState?.setState(() {
      //     widget.widgetKey[index].currentState?.showOverlay = true;
      //   });
      //   setState(() {
      //     index = index + 1;
      //   });
      //   widget.widgetKey[index].currentState?.onButtonTap();
      // },
      // child: widget.child),
    );
  }
}
