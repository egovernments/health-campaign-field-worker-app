import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

import '../../../models/entities/address.dart';
import '../../../router/app_router.dart';
import '../../../widgets/localized.dart';
import '../../../utils/i18_key_constants.dart' as i18;

class SplashAcknowledgementPage extends LocalizedStatefulWidget {
  final bool? isSearch;
  const SplashAcknowledgementPage({
    super.key,
    super.appLocalizations,
    this.isSearch,
  });

  @override
  State<SplashAcknowledgementPage> createState() =>
      _SplashAcknowledgementPageState();
}

class _SplashAcknowledgementPageState
    extends LocalizedState<SplashAcknowledgementPage> {
  @override
  void initState() {
    super.initState();
    if (widget.isSearch == false) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          try {
            // final parent = context.router.parent() as StackRouter;
            // parent.pop();
            context.router.push(DoseAdministeredRoute());
          } catch (e) {
            print('Error during navigation: $e');
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
          context.router.pop();
        },
        isSearch: widget.isSearch ?? true,
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
