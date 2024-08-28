import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../../router/registration_delivery_router.gm.dart';
import '../../../widgets/localized.dart';
import '../../../utils/i18_key_constants.dart' as i18;

@RoutePage()
class SplashAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? enableBackToSearch;
  const SplashAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.enableBackToSearch,
  });

  @override
  State<SplashAcknowledgementPage> createState() =>
      SplashAcknowledgementPageState();
}

class SplashAcknowledgementPageState
    extends LocalizedState<SplashAcknowledgementPage> {
  @override
  void initState() {
    super.initState();
    if (widget.enableBackToSearch == false) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) {
          try {
            context.router.push(DoseAdministeredRoute());
          } catch (e) {
            rethrow;
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DigitAcknowledgement.success(
        action: () {
          context.router.maybePop();
        },
        enableBackToSearch: widget.enableBackToSearch ?? true,
        actionLabel:
            localizations.translate(i18.acknowledgementSuccess.actionLabelText),
        description: localizations.translate(
          i18.acknowledgementSuccess.acknowledgementDescriptionText,
        ),
        label: localizations
            .translate(i18.acknowledgementSuccess.acknowledgementLabelText),
      ),
    );
  }
}
