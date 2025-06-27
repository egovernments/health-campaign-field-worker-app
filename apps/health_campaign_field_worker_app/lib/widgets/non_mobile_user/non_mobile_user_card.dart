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
  final String mobileNumber;
  final void Function() onScanMe;

  const NonMobileUserCard({
    super.key,
    required this.userName,
    required this.individualId,
    required this.gender,
    required this.age,
    required this.mobileNumber,
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
      margin: const EdgeInsets.all(spacer2),
      children: [
        _buildCenteredTextBlock(widget.userName, "${widget.gender}, ${widget.age}", widget.mobileNumber, context),
        _buildIdContainer(context, textTheme),
        _buildQRButton(context),
      ],
    );
  }

  Widget _buildCenteredTextBlock(String userName, String description, String mobileNumber, BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return Center(
      child: Column(
        children: [
          Text(userName,style:  textTheme.headingS.copyWith(color: theme.colorTheme.text.primary)),
          const SizedBox(height: spacer2,),
          Text(description, style: textTheme.bodyXS.copyWith(color: theme.colorTheme.text.secondary),),
          const SizedBox(height: spacer2,),
          Text(mobileNumber, style: textTheme.bodyXS.copyWith(color: theme.colorTheme.text.secondary),),
        ],
      )
    );
  }

  Widget _buildIdContainer(BuildContext context, DigitTextTheme textTheme) {
    final theme = Theme.of(context);

    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: spacer1/2, vertical: spacer1/2),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(spacer2)),
        border: Border(
            left: BorderSide(color: theme.colorTheme.generic.divider),
            right: BorderSide(color: theme.colorTheme.generic.divider),
            bottom: BorderSide(color: theme.colorTheme.generic.divider),
            top: BorderSide(color: theme.colorTheme.generic.divider)),
        color: theme.colorTheme.paper.secondary,
      ),
      child: Center(
        child: Text(widget.individualId,
            style: textTheme.headingXS
                .copyWith(color: theme.colorTheme.primary.primary2)),
      ),
    );
  }

  Widget _buildQRButton(BuildContext context) {
    return DigitButton(
      capitalizeLetters: false,
      type: DigitButtonType.secondary,
      size: DigitButtonSize.medium,
      mainAxisSize: MainAxisSize.max,
      onPressed: () => widget.onScanMe(),
      prefixIcon: Icons.qr_code,
      label: localizations.translate(i18.nonMobileUser.showQrCodeBtnLabel),
    );
  }
}
