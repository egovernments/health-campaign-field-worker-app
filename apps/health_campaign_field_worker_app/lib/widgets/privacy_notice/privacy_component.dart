import 'package:digit_components/digit_components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../data/local_store/no_sql/schema/app_configuration.dart';
import '../../models/privacy_notice/privacy_notice_model.dart';
import '../localized.dart';
import 'privacy_notice_dialog.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PrivacyComponent extends LocalizedStatefulWidget {
  final String formControlName;
  final String text;
  final String linkText;
  final String? trailingText;
  final String validationMessage;

  const PrivacyComponent({
    super.key,
    super.appLocalizations,
    required this.formControlName,
    required this.text,
    required this.linkText,
    this.trailingText,
    required this.validationMessage,
  });

  @override
  State<PrivacyComponent> createState() => _PrivacyComponentState();
}

class _PrivacyComponentState extends LocalizedState<PrivacyComponent> {
  late ValueNotifier<bool> checkboxStateNotifier;

  @override
  void initState() {
    super.initState();
    checkboxStateNotifier = ValueNotifier(false);
  }

  @override
  void dispose() {
    checkboxStateNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ReactiveFormField<bool, bool>(
      formControlName: widget.formControlName,
      builder: (field) {
        return ValueListenableBuilder<bool>(
          valueListenable: checkboxStateNotifier,
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        checkboxStateNotifier.value = !checkboxStateNotifier.value;
                        field.didChange(checkboxStateNotifier.value);
                      },
                      child: value
                          ? Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const DigitColors().burningOrange,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.zero,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.check,
                            size: 16,
                            color: const DigitColors().burningOrange,
                          ),
                        ),
                      )
                          : Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const DigitColors().woodsmokeBlack,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text.rich(
                        TextSpan(
                          text: widget.text,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: const DigitColors().woodsmokeBlack,
                          ),
                          children: [
                            TextSpan(
                              text: widget.linkText,
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: const DigitColors().burningOrange,
                                decoration: TextDecoration.underline,
                                decorationColor: const DigitColors().burningOrange,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      final privacyPolicyJson = AppConfiguration().privacyPolicyConfig;
                                      return FullPageDialog(
                                       privacyPolicy: privacyPolicyJson,
                                        onAccept: () {
                                          checkboxStateNotifier.value = true;
                                          field.didChange(true);
                                        },
                                        onDecline: () {
                                          checkboxStateNotifier.value = false;
                                          field.didChange(false);
                                        },
                                      );
                                    },
                                  );
                                },
                            ),
                            if (widget.trailingText != null)
                              TextSpan(
                                text: widget.trailingText,
                                style: theme.textTheme.bodyLarge?.copyWith(
                                  color: const DigitColors().woodsmokeBlack,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (field.errorText != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    widget.validationMessage,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: const DigitColors().lavaRed,
                    ),
                  ),
                ],
              ],
            );
          },
        );
      },
      validationMessages: {
        ValidationMessage.required: (error) => widget.validationMessage,
      },
    );
  }
}


