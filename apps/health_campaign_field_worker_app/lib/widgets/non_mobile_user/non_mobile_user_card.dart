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
  final String mobileNumber;
  final void Function() onScanMe;
  final void Function() onFaceEnroll;
  final void Function()? onFaceVerify;
  final bool isFaceEnrolled;
  final bool isTimerRunning;
  final bool isVerifiedThisCycle;
  final bool isEnrollmentLoading;

  const NonMobileUserCard({
    super.key,
    required this.userName,
    required this.individualId,
    required this.gender,
    required this.mobileNumber,
    required this.onScanMe,
    required this.onFaceEnroll,
    this.onFaceVerify,
    this.isFaceEnrolled = false,
    this.isTimerRunning = false,
    this.isVerifiedThisCycle = false,
    this.isEnrollmentLoading = false,
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
        _buildCenteredTextBlock(widget.userName, widget.gender.trim(), widget.mobileNumber, context),
        _buildIdContainer(context, textTheme),
        _buildFaceEnrollButton(context),
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
          // Skipped entirely when blank — an individual with no gender
          // recorded would otherwise render an empty line plus its spacer.
          if (description.isNotEmpty) ...[
            Text(description, style: textTheme.bodyXS.copyWith(color: theme.colorTheme.text.secondary),),
            const SizedBox(height: spacer2,),
          ],
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

  Widget _buildFaceEnrollButton(BuildContext context) {
    if (widget.isEnrollmentLoading) {
      return const SizedBox(
        height: 48,
        child: Center(
            child: SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(strokeWidth: 2))),
      );
    }

    if (!widget.isFaceEnrolled) {
      return DigitButton(
        capitalizeLetters: false,
        type: DigitButtonType.primary,
        size: DigitButtonSize.medium,
        mainAxisSize: MainAxisSize.max,
        onPressed: () => widget.onFaceEnroll(),
        prefixIcon: Icons.face,
        label: 'Enroll Face',
      );
    }

    if (!widget.isTimerRunning) return const SizedBox.shrink();

    if (widget.isVerifiedThisCycle) {
      final theme = Theme.of(context);
      return Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: spacer2),
        decoration: BoxDecoration(
          color: theme.colorTheme.alert.success.withOpacity(0.1),
          borderRadius: BorderRadius.circular(spacer2),
          border:
              Border.all(color: theme.colorTheme.alert.success.withOpacity(0.4)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check_circle_outline_rounded,
                color: theme.colorTheme.alert.success, size: 20),
            const SizedBox(width: spacer1),
            Text(
              'Verified',
              style: TextStyle(
                color: theme.colorTheme.alert.success,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }

    return DigitButton(
      capitalizeLetters: false,
      type: DigitButtonType.secondary,
      size: DigitButtonSize.medium,
      mainAxisSize: MainAxisSize.max,
      onPressed: () => widget.onFaceVerify?.call(),
      prefixIcon: Icons.face_unlock_rounded,
      label: 'Verify Face',
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
