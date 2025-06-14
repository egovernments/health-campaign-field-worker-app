import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/TextTheme/digit_text_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../localized.dart';

class NonMobileUserCard extends LocalizedStatefulWidget {
  final String userName;
  final String individualId;
  final String gender;
  final String age;
  final void Function() onScanMe;

  const NonMobileUserCard({
    super.key,
    required this.userName,
    required this.individualId,
    required this.gender,
    required this.age,
    required this.onScanMe,
  });

  @override
  State<NonMobileUserCard> createState() => _NonMobileUserCardState();
}

class _NonMobileUserCardState extends LocalizedState<NonMobileUserCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return DigitCard(
      spacing: spacer2,
      margin: const EdgeInsets.all(spacer2),
      padding: const EdgeInsets.all(spacer3),
      children: [
        _buildCenteredTextBlock(widget.userName, textTheme.headingM),
        _buildCenteredTextBlock(
            "${widget.gender}, ${widget.age}", textTheme.bodyL),
        _buildIdContainer(context, textTheme),
        _buildQRButton(context),
      ],
    );
  }

  Widget _buildCenteredTextBlock(String text, TextStyle? style) {
    return Center(
      child: DigitTextBlock(
        spacing: 0,
        padding: EdgeInsets.zero,
        description: text,
        descriptionStyle: style,
      ),
    );
  }

  Widget _buildIdContainer(BuildContext context, DigitTextTheme textTheme) {
    final theme = Theme.of(context);

    return Container(
      alignment: Alignment.center,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(theme.colorTheme.paper.secondary.value),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(10),
        color: Color(theme.colorTheme.paper.secondary.value),
      ),
      child: DigitTextBlock(
        spacing: 0,
        padding: const EdgeInsets.all(spacer1),
        description: widget.individualId,
        descriptionStyle: textTheme.label,
      ),
    );
  }

  Widget _buildQRButton(BuildContext context) {
    return DigitButton(
      capitalizeLetters: false,
      type: DigitButtonType.secondary,
      size: DigitButtonSize.large,
      mainAxisSize: MainAxisSize.max,
      onPressed: () => widget.onScanMe(),
      prefixIcon: Icons.qr_code,
      label: localizations.translate(i18.nonMobileUser.showQrCodeBtnLabel),
    );
  }
}
