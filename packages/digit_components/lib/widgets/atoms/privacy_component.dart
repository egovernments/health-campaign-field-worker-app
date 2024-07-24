import 'package:digit_components/digit_components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class PrivacyComponent extends StatefulWidget {
  final String formControlName;
  final String text;
  final String linkText;
  final String? trailingText;
  final String validationMessage;

  const PrivacyComponent({
    Key? key,
    required this.formControlName,
    required this.text,
    required this.linkText,
    this.trailingText,
    required this.validationMessage,
  }) : super(key: key);

  @override
  State<PrivacyComponent> createState() => _PrivacyComponentState();
}

class _PrivacyComponentState extends State<PrivacyComponent> {
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
                                      return FullPageDialog(
                                        title: 'Privacy Notice',
                                        content: 'This notice is for eGov to inform you about what data categories are required for a health management campaign to be efficient and why are those datasets required.\n\nIt also covers steps taken by eGov to safeguard your data and data privacy.',
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

class FullPageDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onAccept;
  final VoidCallback onDecline;

  const FullPageDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onAccept,
    required this.onDecline,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: const DigitColors().white,
      child: Container(
        color: const DigitColors().white,
        child: ScrollableContent(
          backgroundColor: const DigitColors().white,
          footer: Container(
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
              padding: const EdgeInsets.all(
                kPadding,
              ),
              child: Column(
                children: [
                  DigitElevatedButton(
                    onPressed: () {
                      onAccept();
                      Navigator.of(context).pop();
                    },
                    child: const Text('I Accept'),
                  ),
                  DigitOutLineButton(
                    onPressed: () {
                      onDecline();
                      Navigator.of(context).pop();
                    },
                    label: 'I Do Not Accept',
                    buttonStyle: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(
                        width: 1.0,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      minimumSize: Size(
                        MediaQuery.of(context).size.width / 1,
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
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, left: 16),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                            color: const DigitColors().woodsmokeBlack,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.close,
                            size: 24,
                            color: const DigitColors().woodsmokeBlack,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      content,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: const DigitColors().woodsmokeBlack,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
