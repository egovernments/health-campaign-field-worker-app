import 'package:digit_components/models/privacy_notice/privacy_notice_model.dart';
import 'package:digit_components/theme/colors.dart';
import 'package:digit_components/widgets/digit_card.dart';
import 'package:digit_components/widgets/digit_elevated_button.dart';
import 'package:digit_components/widgets/digit_outline_button.dart';
import 'package:flutter/material.dart';
import '../../models/privacy_policy_model.dart';
import '../../theme/digit_theme.dart';
import '../localized.dart';
import 'privacy_notice_expand_component.dart';
import '../../utils/i18_key_constants.dart' as i18;


class FullPageDialog extends LocalizedStatefulWidget {
  final PrivacyNoticeModel privacyPolicy;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const FullPageDialog({
    super.key,
    super.appLocalizations,
    required this.privacyPolicy,
    required this.onAccept,
    required this.onDecline,
  });

  @override
  FullPageDialogState createState() => FullPageDialogState();
}

class FullPageDialogState extends LocalizedState<FullPageDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: const DigitColors().white,
      child: Container(
        color: const DigitColors().white,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: kPadding*2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: kPadding*3, left: 0),
                            child: Container(
                              width: MediaQuery.of(context).size.width*.7,
                              child: Text(
                                localizations.translate(widget.privacyPolicy.header ?? ''),
                                maxLines: 3,
                                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                  color: const DigitColors().woodsmokeBlack,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: kPadding),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.close,
                                size: kPadding*4,
                                color: const DigitColors().woodsmokeBlack,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: kPadding*2),
                      if(widget.privacyPolicy.contents != null)
                      Column(
                        children: widget.privacyPolicy.contents!.map((section) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: kPadding*2),
                            child: ExpandableSection(content: section),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(.16),
                    offset: const Offset(0, -1),
                    spreadRadius: 0,
                    blurRadius: 2,
                  ),
                ],
              ),
              child: DigitCard(
                margin: const EdgeInsets.symmetric(horizontal: 0),
                padding: const EdgeInsets.all(kPadding),
                child: Column(
                  children: [
                    DigitElevatedButton(
                      onPressed: () {
                        widget.onAccept();
                        Navigator.of(context).pop();
                      },
                      child: Text(localizations.translate(i18.privacyPolicy.acceptText)),
                    ),
                    DigitOutLineButton(
                      onPressed: () {
                        widget.onDecline();
                        Navigator.of(context).pop();
                      },
                      label: localizations.translate(i18.privacyPolicy.declineText),
                      buttonStyle: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        side: BorderSide(
                          width: 1.0,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                        minimumSize: Size(
                          MediaQuery.of(context).size.width,
                          50,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
