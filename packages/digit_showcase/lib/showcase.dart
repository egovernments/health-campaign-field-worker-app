import 'dart:async';
import 'dart:ui';

import 'package:digit_showcase/shape_clipper.dart';
import 'package:digit_showcase/showcase_widget.dart';
import 'package:digit_showcase/tooltip_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'layout_overlays.dart';

enum TooltipPosition { top, bottom }

class GetPosition {
  final GlobalKey? key;
  final EdgeInsets padding;
  final double? screenWidth;
  final double? screenHeight;

  GetPosition({
    this.key,
    this.padding = EdgeInsets.zero,
    this.screenWidth,
    this.screenHeight,
  });

  Rect getRect() {
    final box = key!.currentContext!.findRenderObject() as RenderBox;

    var boxOffset = box.localToGlobal(const Offset(0.0, 0.0));
    if (boxOffset.dx.isNaN || boxOffset.dy.isNaN) {
      return const Rect.fromLTRB(0, 0, 0, 0);
    }
    final topLeft = box.size.topLeft(boxOffset);
    final bottomRight = box.size.bottomRight(boxOffset);

    final rect = Rect.fromLTRB(
      topLeft.dx - padding.left < 0 ? 0 : topLeft.dx - padding.left,
      topLeft.dy - padding.top < 0 ? 0 : topLeft.dy - padding.top,
      bottomRight.dx + padding.right > screenWidth!
          ? screenWidth!
          : bottomRight.dx + padding.right,
      bottomRight.dy + padding.bottom > screenHeight!
          ? screenHeight!
          : bottomRight.dy + padding.bottom,
    );
    return rect;
  }

  ///Get the bottom position of the widget
  double getBottom() {
    final box = key!.currentContext!.findRenderObject() as RenderBox;
    final boxOffset = box.localToGlobal(const Offset(0.0, 0.0));
    if (boxOffset.dy.isNaN) return padding.bottom;
    final bottomRight = box.size.bottomRight(boxOffset);
    return bottomRight.dy + padding.bottom;
  }

  ///Get the top position of the widget
  double getTop() {
    final box = key!.currentContext!.findRenderObject() as RenderBox;
    final boxOffset = box.localToGlobal(const Offset(0.0, 0.0));
    if (boxOffset.dy.isNaN) return 0 - padding.top;
    final topLeft = box.size.topLeft(boxOffset);
    return topLeft.dy - padding.top;
  }

  ///Get the left position of the widget
  double getLeft() {
    final box = key!.currentContext!.findRenderObject() as RenderBox;
    final boxOffset = box.localToGlobal(const Offset(0.0, 0.0));
    if (boxOffset.dx.isNaN) return 0 - padding.left;
    final topLeft = box.size.topLeft(boxOffset);
    return topLeft.dx - padding.left;
  }

  ///Get the right position of the widget
  double getRight() {
    final box = key!.currentContext!.findRenderObject() as RenderBox;
    final boxOffset = box.localToGlobal(const Offset(0.0, 0.0));
    if (boxOffset.dx.isNaN) return padding.right;
    final bottomRight =
        box.size.bottomRight(box.localToGlobal(const Offset(0.0, 0.0)));
    return bottomRight.dx + padding.right;
  }

  double getHeight() => getBottom() - getTop();

  double getWidth() => getRight() - getLeft();

  double getCenter() => (getLeft() + getRight()) / 2;
}

class Showcase extends StatefulWidget {
  /// A key that is unique across the entire app.
  ///
  /// This Key will be used to control state of individual showcase and also
  /// used in [ShowcaseWidgetState.startShowCase] to define position of current
  /// target widget while showcasing.
  @override
  final GlobalKey key;

  /// Target widget that will be showcased or highlighted
  final Widget child;

  /// Represents subject line of target widget
  final String? title;

  /// Title alignment with in tooltip widget
  ///
  /// Defaults to [TextAlign.start]
  final TextAlign titleAlignment;

  /// Represents summary description of target widget
  final String? description;

  /// ShapeBorder of the highlighted box when target widget will be showcased.
  ///
  /// Note: If [targetBorderRadius] is specified, this parameter will be ignored.
  ///
  /// Default value is:
  /// ```dart
  /// RoundedRectangleBorder(
  ///   borderRadius: BorderRadius.all(Radius.circular(8)),
  /// ),
  /// ```
  final ShapeBorder targetShapeBorder;

  /// Radius of rectangle box while target widget is being showcased.
  final BorderRadius? targetBorderRadius;

  /// TextStyle for default tooltip title
  final TextStyle? titleTextStyle;

  /// TextStyle for default tooltip description
  final TextStyle? descTextStyle;

  /// Empty space around tooltip content.
  ///
  /// Default Value for [Showcase] widget is:
  /// ```dart
  /// EdgeInsets.symmetric(vertical: 8, horizontal: 8)
  /// ```
  final EdgeInsets tooltipPadding;

  /// Background color of overlay during showcase.
  ///
  /// Default value is [Colors.black45]
  final Color overlayColor;

  /// Opacity apply on [overlayColor] (which ranges from 0.0 to 1.0)
  ///
  /// Default to 0.75
  final double overlayOpacity;

  /// Custom tooltip widget when [Showcase.withWidget] is used.
  final Widget? container;

  /// Defines background color for tooltip widget.
  ///
  /// Default to [Colors.white]
  final Color tooltipBackgroundColor;

  /// Defines text color of default tooltip when [titleTextStyle] and
  /// [descTextStyle] is not provided.
  ///
  /// Default to [Colors.black]
  final Color textColor;

  /// If [enableAutoScroll] is sets to `true`, this widget will be shown above
  /// the overlay until the target widget is visible in the viewport.
  final Widget scrollLoadingWidget;

  /// Whether the default tooltip will have arrow to point out the target widget.
  ///
  /// Default to `true`
  final bool showArrow;

  /// Height of [container]
  final double? height;

  /// Width of [container]
  final double? width;

  /// The duration of time the bouncing animation of tooltip should last.
  ///
  /// Default to [Duration(milliseconds: 2000)]
  final Duration movingAnimationDuration;

  /// Triggered when default tooltip is tapped
  final VoidCallback? onToolTipClick;

  /// Triggered when showcased target widget is tapped
  ///
  /// Note: [disposeOnTap] is required if you're using [onTargetClick]
  /// otherwise throws error
  final VoidCallback? onTargetClick;

  /// Will dispose all showcases if tapped on target widget or tooltip
  ///
  /// Note: [onTargetClick] is required if you're using [disposeOnTap]
  /// otherwise throws error
  final bool? disposeOnTap;

  /// Whether tooltip should have bouncing animation while showcasing
  ///
  /// If null value is provided,
  /// [ShowcaseWidget.disableAnimation] will be considered.
  final bool? disableMovingAnimation;

  /// Whether disabling initial scale animation for default tooltip when
  /// showcase is started and completed
  ///
  /// Default to `false`
  final bool? disableScaleAnimation;

  /// Padding around target widget
  ///
  /// Default to [EdgeInsets.zero]
  final EdgeInsets targetPadding;

  /// Triggered when target has been double tapped
  final VoidCallback? onTargetDoubleTap;

  /// Triggered when target has been long pressed.
  ///
  /// Detected when a pointer has remained in contact with the screen at the same location for a long period of time.
  final VoidCallback? onTargetLongPress;

  /// Border Radius of default tooltip
  ///
  /// Default to [BorderRadius.circular(8)]
  final BorderRadius? tooltipBorderRadius;

  /// Description alignment with in tooltip widget
  ///
  /// Defaults to [TextAlign.start]
  final TextAlign descriptionAlignment;

  /// if `disableDefaultTargetGestures` parameter is true
  /// onTargetClick, onTargetDoubleTap, onTargetLongPress and
  /// disposeOnTap parameter will not work
  ///
  /// Note: If `disableDefaultTargetGestures` is true then make sure to
  /// dismiss current showcase with `ShowCaseWidget.of(context).dismiss()`
  /// if you are navigating to other screen. This will be handled by default
  /// if `disableDefaultTargetGestures` is set to false.
  final bool disableDefaultTargetGestures;

  /// Defines blur value.
  /// This will blur the background while displaying showcase.
  ///
  /// If null value is provided,
  /// [ShowcaseWidget.blurValue] will be considered.
  ///
  final double? blurValue;

  /// A duration for animation which is going to played when
  /// tooltip comes first time in the view.
  ///
  /// Defaults to 300 ms.
  final Duration scaleAnimationDuration;

  /// The curve to be used for initial animation of tooltip.
  ///
  /// Defaults to Curves.easeIn
  final Curve scaleAnimationCurve;

  /// An alignment to origin of initial tooltip animation.
  ///
  /// Alignment will be pre-calculated but if pre-calculated
  /// alignment doesn't work then this parameter can be
  /// used to customise the direction of the tooltip animation.
  ///
  /// eg.
  /// ```dart
  ///     Alignment(-0.2,0.3) or Alignment.centerLeft
  /// ```
  final Alignment? scaleAnimationAlignment;

  /// Defines vertical position of tooltip respective to Target widget
  ///
  /// Defaults to adaptive into available space.
  final TooltipPosition? tooltipPosition;

  /// Provides padding around the title. Default padding is zero.
  final EdgeInsets? titlePadding;

  /// Provides padding around the description. Default padding is zero.
  final EdgeInsets? descriptionPadding;

  /// Provides text direction of tooltip title.
  final TextDirection? titleTextDirection;

  /// Provides text direction of tooltip description.
  final TextDirection? descriptionTextDirection;

  final String? nextTitle;
  final String? skipTitle;

  /// Provides a callback when barrier has been clicked.
  ///
  /// Note-: Even if barrier interactions are disabled, this handler
  /// will still provide a callback.
  final VoidCallback? onBarrierClick;

  const Showcase({
    required this.key,
    required this.description,
    required this.child,
    this.title,
    this.titleAlignment = TextAlign.start,
    this.descriptionAlignment = TextAlign.start,
    this.targetShapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
    ),
    this.overlayColor = Colors.black45,
    this.overlayOpacity = 0.65,
    this.titleTextStyle,
    this.descTextStyle,
    this.tooltipBackgroundColor = Colors.white,
    this.textColor = Colors.black,
    this.scrollLoadingWidget = const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.white),
    ),
    this.showArrow = true,
    this.onTargetClick,
    this.disposeOnTap,
    this.movingAnimationDuration = const Duration(milliseconds: 2000),
    this.disableMovingAnimation,
    this.disableScaleAnimation,
    this.tooltipPadding =
        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    this.onToolTipClick,
    this.targetPadding = EdgeInsets.zero,
    this.blurValue,
    this.targetBorderRadius,
    this.onTargetLongPress,
    this.onTargetDoubleTap,
    this.tooltipBorderRadius,
    this.disableDefaultTargetGestures = false,
    this.scaleAnimationDuration = const Duration(milliseconds: 300),
    this.scaleAnimationCurve = Curves.easeIn,
    this.scaleAnimationAlignment,
    this.tooltipPosition,
    this.titlePadding,
    this.descriptionPadding,
    this.titleTextDirection,
    this.descriptionTextDirection,
    this.nextTitle,
    this.skipTitle,
    this.onBarrierClick,
  })  : height = null,
        width = null,
        container = null,
        assert(overlayOpacity >= 0.0 && overlayOpacity <= 1.0,
            "overlay opacity must be between 0 and 1."),
        assert(onTargetClick == null || disposeOnTap != null,
            "disposeOnTap is required if you're using onTargetClick"),
        assert(disposeOnTap == null || onTargetClick != null,
            "onTargetClick is required if you're using disposeOnTap");

  const Showcase.withWidget({
    required this.key,
    required this.height,
    required this.width,
    required this.container,
    required this.child,
    this.targetShapeBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(8),
      ),
    ),
    this.overlayColor = Colors.black45,
    this.targetBorderRadius,
    this.overlayOpacity = 0.65,
    this.scrollLoadingWidget = const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.white)),
    this.onTargetClick,
    this.disposeOnTap,
    this.movingAnimationDuration = const Duration(milliseconds: 2000),
    this.disableMovingAnimation,
    this.targetPadding = EdgeInsets.zero,
    this.blurValue,
    this.onTargetLongPress,
    this.onTargetDoubleTap,
    this.disableDefaultTargetGestures = false,
    this.tooltipPosition,
    this.onBarrierClick,
  })  : showArrow = false,
        onToolTipClick = null,
        scaleAnimationDuration = const Duration(milliseconds: 300),
        scaleAnimationCurve = Curves.decelerate,
        scaleAnimationAlignment = null,
        disableScaleAnimation = null,
        title = null,
        description = null,
        titleAlignment = TextAlign.start,
        descriptionAlignment = TextAlign.start,
        titleTextStyle = null,
        descTextStyle = null,
        tooltipBackgroundColor = Colors.white,
        textColor = Colors.black,
        tooltipBorderRadius = null,
        tooltipPadding = const EdgeInsets.symmetric(vertical: 8),
        titlePadding = null,
        descriptionPadding = null,
        titleTextDirection = null,
        nextTitle = null,
        skipTitle = null,
        descriptionTextDirection = null,
        assert(overlayOpacity >= 0.0 && overlayOpacity <= 1.0,
            "overlay opacity must be between 0 and 1.");

  @override
  State<Showcase> createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  bool _showShowCase = false;
  bool _isScrollRunning = false;
  bool _isTooltipDismissed = false;
  bool _enableShowcase = true;
  Timer? timer;
  GetPosition? position;

  ShowcaseWidgetState get showCaseWidgetState => ShowcaseWidget.of(context);

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _enableShowcase = showCaseWidgetState.enableShowcase;

    if (_enableShowcase) {
      position ??= GetPosition(
        key: widget.key,
        padding: widget.targetPadding,
        screenWidth: MediaQuery.of(context).size.width,
        screenHeight: MediaQuery.of(context).size.height,
      );
      showOverlay();
    }
  }

  /// show overlay if there is any target widget
  void showOverlay() {
    final activeStep = ShowcaseWidget.activeTargetWidget(context);
    setState(() {
      _showShowCase = activeStep == widget.key;
    });

    if (activeStep == widget.key) {
      if (showCaseWidgetState.enableAutoScroll) {
        _scrollIntoView();
      }

      if (showCaseWidgetState.autoPlay) {
        timer = Timer(
            Duration(seconds: showCaseWidgetState.autoPlayDelay.inSeconds),
            _nextIfAny);
      }
    }
  }

  void _scrollIntoView() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() => _isScrollRunning = true);
      await Scrollable.ensureVisible(
        widget.key.currentContext!,
        duration: showCaseWidgetState.widget.scrollDuration,
        alignment: 0.5,
      );
      setState(() => _isScrollRunning = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_enableShowcase) {
      return AnchoredOverlay(
        overlayBuilder: (context, rectBound, offset) {
          final size = MediaQuery.of(context).size;
          position = GetPosition(
            key: widget.key,
            padding: widget.targetPadding,
            screenWidth: size.width,
            screenHeight: size.height,
          );
          return buildOverlayOnTarget(offset, rectBound.size, rectBound, size);
        },
        showOverlay: true,
        child: widget.child,
      );
    }
    return widget.child;
  }

  Future<void> _nextIfAny() async {
    if (timer != null && timer!.isActive) {
      if (showCaseWidgetState.enableAutoPlayLock) {
        return;
      }
      timer!.cancel();
    } else if (timer != null && !timer!.isActive) {
      timer = null;
    }
    await _reverseAnimateTooltip();
    showCaseWidgetState.completed(widget.key);
  }

  Future<void> _getOnTargetTap() async {
    if (widget.disposeOnTap == true) {
      await _reverseAnimateTooltip();
      showCaseWidgetState.dismiss();
      widget.onTargetClick!();
    } else {
      (widget.onTargetClick ?? _nextIfAny).call();
    }
  }

  Future<void> _getOnTooltipTap() async {
    if (widget.disposeOnTap == true) {
      await _reverseAnimateTooltip();
      showCaseWidgetState.dismiss();
    }
    widget.onToolTipClick?.call();
  }

  /// Reverse animates the provided tooltip or
  /// the custom container widget.
  Future<void> _reverseAnimateTooltip() async {
    setState(() => _isTooltipDismissed = true);
    await Future<dynamic>.delayed(widget.scaleAnimationDuration);
    _isTooltipDismissed = false;
  }

  Widget buildOverlayOnTarget(
    Offset offset,
    Size size,
    Rect rectBound,
    Size screenSize,
  ) {
    var blur = 1.0;
    if (_showShowCase) {
      blur = widget.blurValue ?? showCaseWidgetState.blurValue;
    }

    // Set blur to 0 if application is running on web and
    // provided blur is less than 0.
    blur = kIsWeb && blur < 0 ? 0 : blur;

    if (!_showShowCase) return const Offstage();

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            if (!showCaseWidgetState.disableBarrierInteraction) {
              _nextIfAny();
            }
            widget.onBarrierClick?.call();
          },
          child: ClipPath(
            clipper: RRectClipper(
              area: _isScrollRunning ? Rect.zero : rectBound,
              isCircle: widget.targetShapeBorder is CircleBorder,
              radius: _isScrollRunning
                  ? BorderRadius.zero
                  : widget.targetBorderRadius,
              overlayPadding:
                  _isScrollRunning ? EdgeInsets.zero : widget.targetPadding,
            ),
            child: blur != 0
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                    child: Container(
                      padding: const EdgeInsets.all(8.0 / 2),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        color: widget.overlayColor
                            .withOpacity(widget.overlayOpacity),
                      ),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.fromLTRB(
                      8.0,
                      8.0,
                      8.0,
                      8.0,
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: widget.overlayColor
                          .withOpacity(widget.overlayOpacity),
                    ),
                  ),
          ),
        ),
        if (_isScrollRunning) Center(child: widget.scrollLoadingWidget),
        if (!_isScrollRunning) ...[
          _TargetWidget(
            offset: offset,
            size: size,
            onTap: _getOnTargetTap,
            radius: widget.targetBorderRadius,
            onDoubleTap: widget.onTargetDoubleTap,
            onLongPress: widget.onTargetLongPress,
            shapeBorder: widget.targetShapeBorder,
            disableDefaultChildGestures: widget.disableDefaultTargetGestures,
          ),
          ToolTipWidget(
            onNext: () {
              _nextIfAny();
            },
            onSkip: () {
              showCaseWidgetState.dismiss();
            },
            nextTitle: widget.nextTitle ?? 'Next',
            position: position,
            offset: offset,
            screenSize: screenSize,
            title: widget.title,
            titleAlignment: widget.titleAlignment,
            description: widget.description,
            descriptionAlignment: widget.descriptionAlignment,
            titleTextStyle: widget.titleTextStyle,
            descTextStyle: widget.descTextStyle,
            container: widget.container,
            tooltipBackgroundColor: widget.tooltipBackgroundColor,
            textColor: widget.textColor,
            showArrow: widget.showArrow,
            contentHeight: widget.height,
            contentWidth: widget.width,
            onTooltipTap: _getOnTooltipTap,
            tooltipPadding: widget.tooltipPadding,
            disableMovingAnimation: widget.disableMovingAnimation ??
                showCaseWidgetState.disableMovingAnimation,
            disableScaleAnimation: widget.disableScaleAnimation ??
                showCaseWidgetState.disableScaleAnimation,
            movingAnimationDuration: widget.movingAnimationDuration,
            tooltipBorderRadius: widget.tooltipBorderRadius,
            scaleAnimationDuration: widget.scaleAnimationDuration,
            scaleAnimationCurve: widget.scaleAnimationCurve,
            scaleAnimationAlignment: widget.scaleAnimationAlignment,
            isTooltipDismissed: _isTooltipDismissed,
            tooltipPosition: widget.tooltipPosition,
            titlePadding: widget.titlePadding,
            descriptionPadding: widget.descriptionPadding,
            titleTextDirection: widget.titleTextDirection,
            descriptionTextDirection: widget.descriptionTextDirection,
          ),
        ],
      ],
    );
  }
}

class _TargetWidget extends StatelessWidget {
  final Offset offset;
  final Size? size;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final ShapeBorder? shapeBorder;
  final BorderRadius? radius;
  final bool disableDefaultChildGestures;

  const _TargetWidget({
    Key? key,
    required this.offset,
    this.size,
    this.onTap,
    this.shapeBorder,
    this.radius,
    this.onDoubleTap,
    this.onLongPress,
    this.disableDefaultChildGestures = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: offset.dy,
      left: offset.dx,
      child: disableDefaultChildGestures
          ? IgnorePointer(
              child: targetWidgetContent(),
            )
          : targetWidgetContent(),
    );
  }

  Widget targetWidgetContent() {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: GestureDetector(
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        child: Container(
          height: size!.height + 200,
          width: size!.width + 200,
          decoration: ShapeDecoration(
            shape: radius != null
                ? RoundedRectangleBorder(borderRadius: radius!)
                : shapeBorder ??
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
          ),
        ),
      ),
    );
  }
}
