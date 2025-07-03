import 'package:auto_route/auto_route.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/molecules/panel_cards.dart';
import 'package:flutter/material.dart';

import '../widgets/localized.dart';
import '../utils/i18_key_constants.dart' as i18;

@RoutePage()
class TransitPostAcknowledgmentPage extends LocalizedStatefulWidget {
  const TransitPostAcknowledgmentPage({super.key});

  @override
  State<TransitPostAcknowledgmentPage> createState() =>
      _TransitPostAcknowledgmentPageState();
}

class _TransitPostAcknowledgmentPageState
    extends LocalizedState<TransitPostAcknowledgmentPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        try {
          Navigator.of(context).pop();
        } catch (e) {
          rethrow;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PanelCard(
        type: PanelType.success,
        title: localizations.translate(
          i18.transitPost.deliverySuccessfulLabel,
        ),
        description: localizations.translate(
          i18.transitPost.deliverySuccessfulDescription,
        ),
      ),
    );
  }
}
