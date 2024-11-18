import 'package:digit_showcase/showcase.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';

import '../localized.dart';

class ShowcaseItemBuilder {
  final GlobalKey showcaseKey;
  final String messageLocalizationKey;

  ShowcaseItemBuilder({required this.messageLocalizationKey})
      : showcaseKey = GlobalKey(debugLabel: messageLocalizationKey);

  Widget buildWith({required Widget child}) => ShowcaseItemWrapperWidget(
        showcaseKey: showcaseKey,
        messageLocalizationKey: messageLocalizationKey,
        child: child,
      );
}

class ShowcaseItemWrapperWidget extends LocalizedStatefulWidget {
  final Widget child;
  final String messageLocalizationKey;
  final GlobalKey showcaseKey;

  const ShowcaseItemWrapperWidget({
    super.key,
    required this.messageLocalizationKey,
    required this.child,
    required this.showcaseKey,
  });

  @override
  LocalizedState<ShowcaseItemWrapperWidget> createState() =>
      _ShowcaseItemWrapperWidgetState();
}

class _ShowcaseItemWrapperWidgetState
    extends LocalizedState<ShowcaseItemWrapperWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Showcase(
      key: widget.showcaseKey,
      disableMovingAnimation: true,
      disableScaleAnimation: true,
      description: localizations.translate(widget.messageLocalizationKey),
      targetPadding: EdgeInsets.fromLTRB(
        theme.spacerTheme.spacer2 / 2,
        theme.spacerTheme.spacer2 / 2,
        theme.spacerTheme.spacer2 / 2,
        theme.spacerTheme.spacer2 / 2,
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(
          theme.spacerTheme.spacer2 / 2,
          theme.spacerTheme.spacer2 / 2,
          theme.spacerTheme.spacer2 / 2,
          theme.spacerTheme.spacer2 / 2,
        ),
        child: widget.child,
      ),
    );
  }
}
