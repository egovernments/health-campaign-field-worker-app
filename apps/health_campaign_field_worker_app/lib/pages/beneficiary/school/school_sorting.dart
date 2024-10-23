import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../router/app_router.dart';
import '../../../utils/constants.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/localized.dart';

class SchoolIndividualSortingPage extends LocalizedStatefulWidget {
  const SchoolIndividualSortingPage({super.key, super.appLocalizations});

  @override
  State<SchoolIndividualSortingPage> createState() =>
      _SchoolIndividualSortingPageState();
}

class _SchoolIndividualSortingPageState
    extends LocalizedState<SchoolIndividualSortingPage> {
  static const _schoolSorting = "schoolSorting";
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopScope(
      onPopInvoked: (didPop) async {
        Navigator.of(context).pop();
      },
      child: Scaffold(
        body: ReactiveFormBuilder(
          form: buildForm,
          builder: (context, form, child) {
            return ScrollableContent(
              header: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  height: 30,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DigitIconButton(
                        iconSize: 30,
                        icon: Icons.close,
                        onPressed: () {
                          context.router.pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              enableFixedButton: true,
              footer: Padding(
                padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                child: DigitElevatedButton(
                  onPressed: () async {
                    form.markAllAsTouched();
                    if (!form.valid) return;
                    String selectedOption = form.control(_schoolSorting).value;
                    Navigator.of(context).pop(selectedOption);
                  },
                  child: Text(
                    localizations.translate(
                      i18.complaints.sortCTA,
                    ),
                  ),
                ),
              ),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DigitRadioButtonList<String>(
                          labelStyle: DigitTheme
                              .instance.mobileTheme.textTheme.bodyLarge,
                          labelText: "${localizations.translate(
                            i18.householdDetails.sortByLabel,
                          )} :",
                          isEnabled: true,
                          formControlName: _schoolSorting,
                          valueMapper: (value) {
                            return localizations.translate(value);
                          },
                          options: Constants.studentTasksSort,
                          errorMessage: '',
                          onValueChange: (value) {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{
      _schoolSorting: FormControl<String>(value: Constants.studentTasksSort[1]),
    });
  }
}
