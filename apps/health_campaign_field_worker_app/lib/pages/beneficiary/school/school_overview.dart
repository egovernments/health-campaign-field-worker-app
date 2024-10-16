import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../../blocs/household_overview/household_overview.dart';
import '../../../blocs/project/project.dart';
import '../../../blocs/search_households/search_bloc_common_wrapper.dart';
import '../../../blocs/search_households/search_households.dart';
import '../../../router/app_router.dart';
import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/action_card/action_card.dart';
import '../../../widgets/header/back_navigation_help_header.dart';
import '../../../widgets/localized.dart';

class SchoolOverviewPage extends LocalizedStatefulWidget {
  const SchoolOverviewPage({super.key, super.appLocalizations});

  @override
  State<SchoolOverviewPage> createState() => _HouseholdOverviewPageState();
}

class _HouseholdOverviewPageState extends LocalizedState<SchoolOverviewPage> {
  @override
  void initState() {
    final bloc = context.read<HouseholdOverviewBloc>();
    bloc.add(
      HouseholdOverviewReloadEvent(
        projectId: context.projectId,
        projectBeneficiaryType: context.beneficiaryType,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final beneficiaryType = context.beneficiaryType;

    return PopScope(
      onPopInvoked: (didPop) async {
        context
            .read<SearchBlocWrapper>()
            .searchHouseholdsBloc
            .add(const SearchHouseholdsClearEvent());
        Navigator.of(context).pop();
      },
      child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
        builder: (ctx, state) {
          return Scaffold(
            body: state.loading
                ? const Center(child: CircularProgressIndicator())
                : BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
                    builder: (ctx, state) {
                      if (state.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return ScrollableContent(
                        header: BackNavigationHelpHeaderWidget(
                          handleback: () {
                            context
                                .read<SearchBlocWrapper>()
                                .searchHouseholdsBloc
                                .add(const SearchHouseholdsClearEvent());
                          },
                        ),
                        enableFixedButton: true,
                        footer: Padding(
                          padding: const EdgeInsets.fromLTRB(
                              kPadding, 0, kPadding, 0),
                          child: DigitElevatedButton(
                            onPressed: () async {
                              var bloc = context.read<SearchBlocWrapper>();

                              context.router.push(
                                BeneficiaryWrapperRoute(
                                  wrapper:
                                      bloc.state.householdMembers.firstOrNull!,
                                  children: [
                                    SchoolIndividualListRoute(),
                                  ],
                                ),
                              );
                            },
                            child: Text(
                              localizations.translate(
                                i18.householdDetails.actionLabel,
                              ),
                            ),
                          ),
                        ),
                        slivers: [
                          SliverToBoxAdapter(
                            child: DigitCard(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Column(
                                    children: [
                                      BlocBuilder<ProjectBloc, ProjectState>(
                                        builder: (context, projectState) {
                                          return Align(
                                            alignment: Alignment.centerRight,
                                            child: DigitIconButton(
                                              onPressed: () =>
                                                  DigitActionDialog.show(
                                                context,
                                                widget: ActionCard(
                                                  items: [
                                                    ActionCardModel(
                                                      icon: Icons.edit,
                                                      label: localizations
                                                          .translate(
                                                        i18.schoolOverView
                                                            .schoolOverViewEditLabel,
                                                      ),
                                                      action: () async {
                                                        final projectId =
                                                            context.projectId;

                                                        final bloc = context.read<
                                                            HouseholdOverviewBloc>();
                                                        Navigator.of(
                                                          context,
                                                          rootNavigator: true,
                                                        ).pop();

                                                        HouseholdMemberWrapper
                                                            wrapper = state
                                                                .householdMemberWrapper;

                                                        final timestamp = wrapper
                                                            .projectBeneficiaries
                                                            .first
                                                            .dateOfRegistration;
                                                        // [TODO ]
                                                        final date = DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                          timestamp,
                                                        );

                                                        final address = wrapper
                                                            .household.address;

                                                        if (address == null)
                                                          return;

                                                        final projectBeneficiary = state
                                                            .householdMemberWrapper
                                                            .projectBeneficiaries
                                                            .firstWhereOrNull(
                                                          (element) =>
                                                              element
                                                                  .beneficiaryClientReferenceId ==
                                                              wrapper.household
                                                                  .clientReferenceId,
                                                        );

                                                        await context
                                                            .router.root
                                                            .push(
                                                          BeneficiaryRegistrationWrapperRoute(
                                                            initialState:
                                                                BeneficiaryRegistrationEditHouseholdState(
                                                              addressModel:
                                                                  address,
                                                              individualModel:
                                                                  wrapper
                                                                      .members,
                                                              householdModel:
                                                                  wrapper
                                                                      .household,
                                                              registrationDate:
                                                                  date,
                                                              projectBeneficiaryModel:
                                                                  projectBeneficiary,
                                                            ),
                                                            children: [
                                                              SchoolDetailsRoute(),
                                                            ],
                                                          ),
                                                        );

                                                        bloc.add(
                                                          HouseholdOverviewReloadEvent(
                                                            projectId:
                                                                projectId,
                                                            projectBeneficiaryType:
                                                                beneficiaryType,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              iconText: localizations.translate(
                                                i18.schoolOverView
                                                    .schoolOverViewEditIconText,
                                              ),
                                              icon: Icons.edit,
                                            ),
                                          );
                                        },
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                            left: kPadding - 1,
                                            right: kPadding + 1,
                                          ),
                                          child: Text(
                                            localizations.translate(i18
                                                .schoolOverView
                                                .schoolOverViewLabel),
                                            style:
                                                theme.textTheme.displayMedium,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: kPadding,
                                      right: kPadding,
                                    ),
                                    child: DigitTableCard(
                                      element: {
                                        localizations.translate(
                                          i18.schoolOverView.schoolName,
                                        ): state.householdMemberWrapper
                                            .household.additionalFields?.fields
                                            .where((element) =>
                                                element.key == 'schoolName')
                                            .first
                                            .value,
                                        localizations.translate(i18
                                                .schoolOverView
                                                .schoolOverViewHeadNameLabel):
                                            state
                                                .householdMemberWrapper
                                                .headOfHousehold
                                                .name
                                                ?.givenName,
                                        localizations.translate(
                                          i18.schoolOverView.studentsCount,
                                        ): state.householdMemberWrapper
                                            .household.memberCount,
                                        localizations.translate(
                                          i18.householdLocation
                                              .administrationAreaFormLabel,
                                        ): context.boundary.name,
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
