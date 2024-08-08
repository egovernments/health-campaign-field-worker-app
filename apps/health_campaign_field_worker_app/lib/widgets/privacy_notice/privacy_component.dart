import 'package:digit_components/digit_components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
                                      final privacyPolicyJson = {
                                        "header": "PRIVACY_HEADER",
                                        "module": "HCM",
                                        "contents": [
                                          {
                                            "header": "PRIVACY_HEADER_1_SUB_1",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_1_SUB_1_DESC_1",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_1_SUB_1_DESC_2",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_1_SUB_1_DESC_3",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_1_SUB_1_DESC_4",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_1_SUB_1_DESC_5",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_1_SUB_1_DESC_6",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_1_SUB_1_DESC_7",
                                                "type": null,
                                                "isBold": false
                                              }
                                            ]
                                          },
                                          {
                                            "header": "PRIVACY_HEADER_2_SUB_2",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_2_SUB_2_DESC_1",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_2_SUB_2_DESC_2",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_2_SUB_2_DESC_3",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_2_SUB_2_DESC_4",
                                                "type": null,
                                                "isBold": false,
                                                "subDescriptions": [
                                                  {
                                                    "text": "PRIVACY_HEADER_2_SUB_2_DESC_3_SUBDESC_1",
                                                    "type": null,
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_2_SUB_2_DESC_3_SUBDESC_2",
                                                    "type": null,
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  }
                                                ]
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_2_SUB_2_DESC_5",
                                                "type": null,
                                                "isBold": false
                                              }
                                            ]
                                          },
                                          {
                                            "header": "PRIVACY_HEADER_3_SUB_3",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_3_SUB_3_DESC_1",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_3_SUB_3_DESC_2",
                                                "type": null,
                                                "isBold": false
                                              }
                                            ]
                                          },
                                          {
                                            "header": "PRIVACY_HEADER_4_SUB_4",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_4_SUB_4_DESC_1",
                                                "type": null,
                                                "isBold": false,
                                                "subDescriptions": [
                                                  {
                                                    "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_1",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_2",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_3",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_4",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_5",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_6",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_4_SUB_4_DESC_1_SUBDESC_7",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  }
                                                ]
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_4_SUB_4_DESC_2",
                                                "type": null,
                                                "isBold": false
                                              }
                                            ]
                                          },
                                          {
                                            "header": "PRIVACY_HEADER_5_SUB_5",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_5_SUB_5_DESC_1",
                                                "type": null,
                                                "isBold": false,
                                                "subDescriptions": [
                                                  {
                                                    "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_1",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_2",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_3",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_4",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_5",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_5_SUB_5_DESC_1_SUBDESC_6",
                                                    "type": "points",
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  }
                                                ]
                                              }
                                            ]
                                          },
                                          {
                                            "header": "PRIVACY_HEADER_6_SUB_1",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_6_SUB_6_DESC_1",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_6_SUB_6_DESC_2",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_6_SUB_6_DESC_3",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_6_SUB_6_DESC_4",
                                                "type": null,
                                                "isBold": false
                                              }
                                            ]
                                          },
                                          {
                                            "header": "PRIVACY_HEADER_7_SUB_1",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_7_SUB_7_DESC_1",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_7_SUB_7_DESC_2",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_7_SUB_7_DESC_3",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_7_SUB_7_DESC_4",
                                                "type": null,
                                                "isBold": false
                                              }
                                            ]
                                          },
                                          {
                                            "header": "PRIVACY_HEADER_8_SUB_1",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_8_SUB_8_DESC_1",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_8_SUB_8_DESC_2",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_8_SUB_8_DESC_3",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_8_SUB_8_DESC_4",
                                                "type": null,
                                                "isBold": false
                                              }
                                            ]
                                          },
                                          {
                                            "header": "PRIVACY_HEADER_9_SUB_9",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_9_SUB_9_DESC_1",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_9_SUB_9_DESC_2",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_9_SUB_9_DESC_3",
                                                "type": null,
                                                "isBold": false,
                                                "subDescriptions": [
                                                  {
                                                    "text": "PRIVACY_HEADER_9_SUB_9_DESC_3_SUBDESC_1",
                                                    "type": null,
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_9_SUB_9_DESC_3_SUBDESC_2",
                                                    "type": null,
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  }
                                                ]
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_9_SUB_9_DESC_4",
                                                "type": null,
                                                "isBold": false,
                                                "subDescriptions": [
                                                  {
                                                    "text": "PRIVACY_HEADER_9_SUB_9_DESC_4_SUBDESC_1",
                                                    "type": null,
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  }
                                                ]
                                              },

                                              {
                                                "text": "PRIVACY_HEADER_9_SUB_9_DESC_5",
                                                "type": null,
                                                "isBold": false,
                                                "subDescriptions":[
                                                  {
                                                    "text": "PRIVACY_HEADER_9_SUB_9_DESC_5_SUBDESC_1",
                                                    "type": null,
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  },
                                                  {
                                                    "text": "PRIVACY_HEADER_9_SUB_9_DESC_5_SUBDESC_2",
                                                    "type": null,
                                                    "isBold": false,
                                                    "isSpaceRequired": true
                                                  }
                                                ]
                                              }
                                            ]
                                          },
                                          {
                                            "header": "PRIVACY_HEADER_10_SUB_10",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_10_SUB_10_DESC_1",
                                                "type": null,
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_10_SUB_10_DESC_2",
                                                "type": null,
                                                "isBold": false
                                              }
                                            ]
                                          },
                                          {
                                            "header": "PRIVACY_HEADER_11_SUB_11",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_11_SUB_11_DESC_1",
                                                "type": null,
                                                "isBold": false
                                              }
                                            ]
                                          },
                                          {
                                            "header": "PRIVACY_HEADER_12_SUB_12",
                                            "descriptions": [
                                              {
                                                "text": "PRIVACY_HEADER_12_SUB_12_DESC_1",
                                                "type": "step",
                                                "isBold": false
                                              },
                                              {
                                                "text": "PRIVACY_HEADER_12_SUB_12_DESC_2",
                                                "type": "step",
                                                "isBold": false
                                              }
                                            ]
                                          }
                                        ]
                                      };
                                      final privacyPolicy = PrivacyPolicyModel.fromJson(privacyPolicyJson);
                                      return FullPageDialog(
                                       privacyPolicy: privacyPolicy,
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


