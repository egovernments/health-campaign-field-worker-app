import 'package:auto_route/auto_route.dart';
import 'package:complaints/widgets/localized.dart';
import 'package:digit_ui_components/enum/app_enums.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/theme/spacers.dart';
import 'package:digit_ui_components/widgets/atoms/digit_button.dart';
import 'package:digit_ui_components/widgets/helper_widget/button_list.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/scrollable_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../blocs/complaint_wrapper/complaint_wrapper_bloc.dart';
import '../../utils/constants.dart';

@RoutePage()
class ComplaintsInboxDialogPage extends LocalizedStatefulWidget {
  final ComplaintsInboxDialogType type;
  final FormGroup Function() buildForm; // removed ComplaintInboxState param
  final Widget Function(BuildContext, FormGroup) buildFields;
  final String titleKey;
  final String ctaKey;
  final void Function(BuildContext, FormGroup) onSubmit;

  const ComplaintsInboxDialogPage({
    super.key,
    required this.type,
    required this.buildForm,
    required this.buildFields,
    required this.titleKey,
    required this.ctaKey,
    required this.onSubmit,
  });

  @override
  State<ComplaintsInboxDialogPage> createState() =>
      _ComplaintsInboxDialogPageState();
}

class _ComplaintsInboxDialogPageState
    extends LocalizedState<ComplaintsInboxDialogPage> {
  late FormGroup _formGroup;

  @override
  void initState() {
    super.initState();
    _formGroup = widget.buildForm();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.onPrimary,
      body: ReactiveForm(
        formGroup: _formGroup,
        child: ScrollableContent(
          header: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: spacer4, top: spacer2),
                    child: Text(
                      localizations.translate(widget.titleKey),
                      style: textTheme.headingXl
                          .copyWith(color: theme.colorTheme.primary.primary2),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: spacer2, right: spacer2),
                child: InkWell(
                  onTap: () {
                    context.router.pop();
                  },
                  child: const Icon(
                    Icons.close,
                    size: spacer6,
                  ),
                ),
              ),
            ],
          ),
          footer: DigitCard(
            inline: true,
            cardType: CardType.primary,
            margin: const EdgeInsets.fromLTRB(0, spacer2, 0, 0),
            children: [
              DigitButtonListTile(
                  isVertical: false,
                  spacing: spacer4,
                  buttons: [
                    DigitButton(
                      mainAxisSize: MainAxisSize.min,
                      type: DigitButtonType.secondary,
                      size: DigitButtonSize.large,
                      label: 'Clear all',
                      onPressed: () {
                        _formGroup.reset();
                        context
                            .read<ComplaintWrapperBloc>()
                            .add(const ComplaintWrapperEvent.loadFromGlobal());
                      },
                    ),
                    DigitButton(
                      mainAxisSize: MainAxisSize.min,
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      label: localizations.translate(widget.ctaKey),
                      onPressed: () => widget.onSubmit(context, _formGroup),
                    ),
                  ])
            ],
          ),
          children: [
            Padding(
              padding: const EdgeInsets.all(spacer2 * 2),
              child: widget.buildFields(context, _formGroup),
            ),
          ],
        ),
      ),
    );
  }
}
