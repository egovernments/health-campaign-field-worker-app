import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/TextTheme/digit_text_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/text_block.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import '../localized.dart';

class NonSystemUserCard extends LocalizedStatefulWidget {
  final String userName;
  final String role;
  final String gender;
  final String age;
  final String? mobilenumber;
  final void Function(dynamic value) onScanMe;

  const NonSystemUserCard({
    super.key,
    required this.userName,
    required this.role,
    required this.gender,
    required this.age,
    this.mobilenumber,
    required this.onScanMe,
  });

  @override
  State<NonSystemUserCard> createState() => _NonSystemUserCardState();
}

class _NonSystemUserCardState extends LocalizedState<NonSystemUserCard> {
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
        _buildCenteredTextBlock(widget.role, textTheme.bodyL),
        _buildCenteredTextBlock("${widget.gender}, ${widget.age}", textTheme.bodyL),
        if (widget.mobilenumber != null)
          _buildCenteredTextBlock("+91 ${widget.mobilenumber}", textTheme.bodyL),
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
        description: "ID 56565656",
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
      onPressed: () => widget.onScanMe("data to be sent"),
      prefixIcon: Icons.qr_code,
      label: localizations.translate("Show QR Code"),
    );
  }
}
