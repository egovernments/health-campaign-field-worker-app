import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../blocs/search_households/search_bloc_common_wrapper.dart';
import '../../../blocs/search_households/search_by_school.dart';
import '../../../blocs/search_households/search_households.dart';
import '../../../router/app_router.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

class SchoolSelectionPage extends LocalizedStatefulWidget {
  const SchoolSelectionPage({
    super.key,
  });

  @override
  State<SchoolSelectionPage> createState() => _SchoolSelectionPageState();
}

class _SchoolSelectionPageState extends LocalizedState<SchoolSelectionPage> {
  SearchHouseholdsState searchHouseholdsState = const SearchHouseholdsState(
    loading: false,
    householdMembers: [],
  );
  late final SearchBlocWrapper blocWrapper; //
  // Declare BlocWrapper
  static const _schoolName = 'schoolKey';

  @override
  void initState() {
    super.initState();

    // Initialize the BlocWrapper with instances of SearchHouseholdsBloc, SearchMemberBloc, and ProximitySearchBloc
    blocWrapper = context.read<SearchBlocWrapper>();

    // Listen to state changes
    blocWrapper.stateChanges.listen((state) {
      if (mounted) {
        setState(() {
          searchHouseholdsState = state;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context);
    final theme = Theme.of(context);
    final BorderSide borderSide = BorderSide(
      color: theme.colorScheme.outline,
      width: 1.0,
    );

    return ReactiveFormBuilder(
      form: _form,
      builder: (context, form, child) {
        return Scaffold(
          body: ScrollableContent(
            backgroundColor: Colors.white,
            header: const BackNavigationHelpHeaderWidget(),
            footer: Padding(
              padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
              child: DigitElevatedButton(
                onPressed: form.valid && !searchHouseholdsState.loading
                    ? () {
                        if (!form.valid) return;
                        final bloc = context.read<SearchBlocWrapper>();

                        bloc.searchBySchoolName
                            .add(SearchHouseholdsEvent.searchBySchool(
                          searchText: form.control(_schoolName).value,
                          projectId: context.projectId,
                          boundaryCode: context.boundaryOrNull!.code!,
                          limit: 10,
                          offset: 0,
                        ));
                      }
                    : null,
                child: !searchHouseholdsState.loading
                    ? Text(
                        localizations.translate(i18.common.coreCommonContinue),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
            children: [
              BlocListener<SearchBySchoolBloc, SearchHouseholdsState>(
                listener: (context, state) {
                  if (!state.loading) {
                    if (state.householdMembers.isNotEmpty) {
                      context.router.push(
                        BeneficiaryWrapperRoute(
                          wrapper: state.householdMembers.firstOrNull!,
                          children: [
                            SchoolOverviewRoute(),
                          ],
                        ),
                      );
                    } else {
                      DigitToast.show(
                        context,
                        options: DigitToastOptions(
                          i18.schoolDetails.notRegistered,
                          true,
                          theme,
                        ),
                      );
                      context.router.push(
                        BeneficiaryRegistrationWrapperRoute(
                          initialState: BeneficiaryRegistrationCreateState(
                            searchQuery: form.control(_schoolName).value,
                          ),
                          children: [SchoolDetailsRoute()],
                        ),
                      );
                    }
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: DigitCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          localizations
                              .translate(i18.schoolDetails.selectSchool),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                        DigitDropdown<String>(
                          label: localizations.translate(
                            i18.schoolDetails.selectSchool,
                          ),
                          valueMapper: (value) =>
                              localizations.translate(value),
                          initialValue: context.schoolsList.firstOrNull,
                          menuItems: context.schoolsList
                              .map(
                                (e) => e,
                              )
                              .toList(),
                          formControlName: _schoolName,
                          isRequired: true,
                          onChanged: (value) {
                            form.control(_schoolName).value = value;
                            form.markAllAsTouched();
                          },
                          validationMessages: {
                            'required': (object) => localizations.translate(
                                  i18.common.corecommonRequired,
                                ),
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  FormGroup _form() {
    return fb.group({
      _schoolName: FormControl<String>(
        value: context.schoolsList.firstOrNull,
        validators: [Validators.required],
      ),
    });
  }
}
