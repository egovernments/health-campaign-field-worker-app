import 'dart:convert';

import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:digit_components/utils/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:recase/recase.dart';

import '../../blocs/household_overview/household_overview.dart';
import '../../blocs/localization/app_localization.dart';
import '../../blocs/product_variant/product_variant.dart';
import '../../blocs/project/project.dart';
import '../../blocs/search_households/search_households.dart';
import '../../data/local_store/sql_store/tables/project.dart';
import '../../models/data_model.dart';
import '../../router/app_router.dart';
import '../../utils/utils.dart';
import '../../widgets/action_card/action_card.dart';
import '../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../beneficiary_registration/household_details.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';

class BeneficiaryDetailsPage extends LocalizedStatefulWidget {
  const BeneficiaryDetailsPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<BeneficiaryDetailsPage> createState() => _BeneficiaryDetailsPageState();
}

class _BeneficiaryDetailsPageState
    extends LocalizedState<BeneficiaryDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context);
    final router = context.router;

    final headerList = [
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryDoseNo),
        cellKey: 'dose',
      ),
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryStatus),
        cellKey: 'Status',
      ),
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryResources),
        cellKey: 'resources',
      ),
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryQuantity),
        cellKey: 'quantity',
      ),
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryCompletedOn),
        cellKey: 'completedOn',
      ),
    ];

    final headerListResource = [
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryDose),
        cellKey: 'dose',
      ),
      TableHeader(
        localizations.translate(i18.beneficiaryDetails.beneficiaryResources),
        cellKey: 'resources',
      ),
    ];

    return ProductVariantBlocWrapper(
      child: BlocBuilder<HouseholdOverviewBloc, HouseholdOverviewState>(
        builder: (context, state) {
          final householdMemberWrapper = state.householdMemberWrapper;

          final projectBeneficiary =
              context.beneficiaryType != BeneficiaryType.individual
                  ? [householdMemberWrapper.projectBeneficiaries.first]
                  : householdMemberWrapper.projectBeneficiaries
                      .where(
                        (element) =>
                            element.beneficiaryClientReferenceId ==
                            state.selectedIndividual?.clientReferenceId,
                      )
                      .toList();

          final taskData = state.householdMemberWrapper.tasks
              ?.where((element) =>
                  element.projectBeneficiaryClientReferenceId ==
                  projectBeneficiary.first.clientReferenceId)
              .toList();

          Widget buildTableContent(ProjectState projectState) {
            print(projectState);

            return SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DigitTableCard(
                    element: {
                      localizations.translate(
                        i18.beneficiaryDetails.beneficiaryAge,
                      ): "2",
                    },
                  ),
                  const Divider(),
                  DigitTable(
                    headerList: headerListResource,
                    tableData: projectState.projectType!.cycles!
                        .expand(
                          (e) => e.deliveries!.map(
                            (item) => TableDataRow([
                              TableData(
                                'Dose ${e.deliveries!.indexOf(item)}',
                                cellKey: 'dose',
                              ),
                              TableData(
                                taskData != null
                                    ? taskData.length - 1 >=
                                            e.deliveries!.indexOf(
                                              item,
                                            )
                                        ? taskData
                                            .elementAt(
                                              e.deliveries!.indexOf(
                                                item,
                                              ),
                                            )
                                            .resources!
                                            .map((e) => e.productVariantId)
                                            .toList()
                                            .join(
                                              ' + ',
                                            )
                                        : '-'
                                    : item.productVariants != null
                                        ? item.productVariants!
                                            .map((e) => e.productVariantId)
                                            .toList()
                                            .join(' + ')
                                        : '-',
                                cellKey: 'resources',
                              ),
                            ]),
                          ),
                        )
                        .toList(),
                    leftColumnWidth: 130,
                    rightColumnWidth: headerList.length * 17 * 2,
                    height: MediaQuery.of(context).size.height / 5,
                  ),
                ],
              ),
            );
          }

          return Scaffold(
            body: ReactiveFormBuilder(
              form: buildForm,
              builder: (context, formGroup, child) =>
                  BlocBuilder<ProjectBloc, ProjectState>(
                builder: (context, state) {
                  return ScrollableContent(
                    header: const Column(children: [
                      BackNavigationHelpHeaderWidget(),
                    ]),
                    footer: SizedBox(
                      height: 85,
                      child: DigitCard(
                        margin:
                            const EdgeInsets.only(left: 0, right: 0, top: 10),
                        child: DigitElevatedButton(
                          onPressed: () async {
                            DigitDialog.show<bool>(
                              context,
                              options: DigitDialogOptions(
                                titleText: localizations.translate(
                                  i18.beneficiaryDetails.reourcesTobeDelivered,
                                ),
                                content: buildTableContent(state),
                                primaryAction: DigitDialogActions(
                                  label: localizations.translate(
                                    i18.beneficiaryDetails.ctaProceed,
                                  ),
                                  action: (context) => {
                                    Navigator.of(context).pop(),
                                    router.push(DeliverInterventionRoute()),
                                  },
                                ),
                              ),
                            );
                          },
                          child: Center(
                            child: Text(
                              localizations
                                  .translate(i18.common.coreCommonNext),
                            ),
                          ),
                        ),
                      ),
                    ),
                    children: [
                      DigitCard(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    localizations.translate(i18
                                        .beneficiaryDetails
                                        .beneficiarysDetailsLabelText),
                                    style: theme.textTheme.displayMedium,
                                  ),
                                ),
                                DigitIconButton(
                                  onPressed: () => DigitActionDialog.show(
                                    context,
                                    widget: ActionCard(
                                      items: [
                                        ActionCardModel(
                                          icon: Icons.edit,
                                          label: localizations.translate(
                                            i18.beneficiaryDetails
                                                .beneficiarysDetailsEditIconLabel,
                                          ),
                                          action: () async {},
                                        ),
                                        ActionCardModel(
                                          icon: Icons.delete,
                                          label: localizations.translate(i18
                                              .beneficiaryDetails
                                              .beneficiarysDetailsDeleteIconLabel),
                                          action: () => null,
                                          // action: () => DigitDialog.show(
                                          //   context,
                                          //   options: DigitDialogOptions(
                                          //     titleText: localizations.translate(i18
                                          //         .householdOverView
                                          //         .householdOverViewActionCardTitle),
                                          //     primaryAction: DigitDialogActions(
                                          //       label: localizations.translate(i18
                                          //           .householdOverView
                                          //           .householdOverViewPrimaryActionLabel),
                                          //       action: (ctx) {
                                          //         Navigator.of(
                                          //           ctx,
                                          //           rootNavigator: true,
                                          //         )
                                          //           ..pop()
                                          //           ..pop();
                                          //         context.router.push(
                                          //           ReasonForDeletionRoute(
                                          //             isHousholdDelete: true,
                                          //           ),
                                          //         );
                                          //       },
                                          //     ),
                                          //     secondaryAction: DigitDialogActions(
                                          //       label: localizations.translate(i18
                                          //           .householdOverView
                                          //           .householdOverViewSecondaryActionLabel),
                                          //       action: (context) {
                                          //         Navigator.of(
                                          //           context,
                                          //           rootNavigator: true,
                                          //         ).pop();
                                          //       },
                                          //     ),
                                          //   ),
                                          // ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  iconText: localizations.translate(
                                    i18.beneficiaryDetails
                                        .beneficiarysDetailsEditIconLabelText,
                                  ),
                                  icon: Icons.edit,
                                ),
                              ],
                            ),
                            DigitTableCard(
                              element: {
                                localizations.translate(i18.householdOverView
                                        .householdOverViewHouseholdHeadLabel):
                                    householdMemberWrapper
                                            .headOfHousehold.name?.givenName ??
                                        '',
                                localizations.translate(
                                  i18.deliverIntervention.idTypeText,
                                ): () {
                                  final identifiers = householdMemberWrapper
                                      .headOfHousehold.identifiers;
                                  if (identifiers == null ||
                                      identifiers.isEmpty) {
                                    return '';
                                  }

                                  return identifiers.first.identifierType ?? '';
                                }(),
                                localizations.translate(
                                  i18.deliverIntervention.idNumberText,
                                ): () {
                                  final identifiers = householdMemberWrapper
                                      .headOfHousehold.identifiers;
                                  if (identifiers == null ||
                                      identifiers.isEmpty) {
                                    return '';
                                  }

                                  return identifiers.first.identifierId ?? '';
                                }(),
                                localizations.translate(
                                  i18.common.coreCommonAge,
                                ): () {
                                  final dob = householdMemberWrapper
                                      .headOfHousehold.dateOfBirth;
                                  if (dob == null || dob.isEmpty) {
                                    return '';
                                  }

                                  final int years = DigitDateUtils.calculateAge(
                                    DigitDateUtils.getFormattedDateToDateTime(
                                          dob,
                                        ) ??
                                        DateTime.now(),
                                  ).years;
                                  final int months =
                                      DigitDateUtils.calculateAge(
                                    DigitDateUtils.getFormattedDateToDateTime(
                                          dob,
                                        ) ??
                                        DateTime.now(),
                                  ).months;

                                  return "$years ${localizations.translate(i18.memberCard.deliverDetailsYearText)} $months ${localizations.translate(i18.memberCard.deliverDetailsMonthsText)}";
                                }(),
                                localizations.translate(
                                  i18.common.coreCommonGender,
                                ): householdMemberWrapper.headOfHousehold.gender
                                        ?.name.sentenceCase ??
                                    '',
                                localizations.translate(
                                  i18.common.coreCommonMobileNumber,
                                ): householdMemberWrapper
                                        .headOfHousehold.mobileNumber ??
                                    '',
                                localizations.translate(i18.deliverIntervention
                                    .dateOfRegistrationLabel): () {
                                  final date = projectBeneficiary
                                      .first.dateOfRegistration;

                                  final registrationDate =
                                      DateTime.fromMillisecondsSinceEpoch(
                                    date,
                                  );

                                  return DateFormat('dd MMMM yyyy')
                                      .format(registrationDate);
                                }(),
                              },
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: state.projectType!.cycles!.map((e) {
                          final int cycleIndex =
                              state.projectType!.cycles!.indexOf(e) + 1;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DigitCard(
                                child: (state.projectType?.cycles != null)
                                    ? state.projectType!.cycles!.isNotEmpty
                                        ? Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Cycle  $cycleIndex',
                                                style: theme
                                                    .textTheme.headlineMedium,
                                                textAlign: TextAlign.left,
                                              ),
                                              BlocBuilder<ProductVariantBloc,
                                                  ProductVariantState>(
                                                builder:
                                                    (context, productState) {
                                                  return productState.maybeWhen(
                                                    orElse: () =>
                                                        const Offstage(),
                                                    fetched: (productVariants) {
                                                      final RegExp regexp =
                                                          RegExp(r'^0+(?=.)');

                                                      final taskCycleindex =
                                                          taskData != null
                                                              ? int.tryParse(taskData
                                                                  .last
                                                                  .additionalFields!
                                                                  .fields[3]
                                                                  .value
                                                                  .toString()
                                                                  .replaceAll(
                                                                    regexp,
                                                                    '',
                                                                  ))
                                                              : 0;

                                                      return DigitTable(
                                                        selectedIndex: cycleIndex ==
                                                                    taskCycleindex &&
                                                                taskData != null
                                                            ? int.tryParse(taskData
                                                                .last
                                                                .additionalFields!
                                                                .fields[4]
                                                                .value
                                                                .toString()
                                                                .replaceAll(
                                                                  regexp,
                                                                  '',
                                                                ))
                                                            : null,

                                                        headerList: headerList,
                                                        tableData:
                                                            e.deliveries!.map(
                                                          (item) {
                                                            return TableDataRow([
                                                              TableData(
                                                                'Dose ${e.deliveries!.indexOf(item)}',
                                                                cellKey: 'dose',
                                                              ),
                                                              TableData(
                                                                'In complete ',
                                                                cellKey:
                                                                    'Status',
                                                              ),
                                                              TableData(
                                                                taskData != null
                                                                    ? taskData.length -
                                                                                1 >=
                                                                            e.deliveries!
                                                                                .indexOf(
                                                                              item,
                                                                            )
                                                                        ? taskData
                                                                            .elementAt(
                                                                              e.deliveries!.indexOf(
                                                                                item,
                                                                              ),
                                                                            )
                                                                            .resources!
                                                                            .map((e) => e
                                                                                .productVariantId)
                                                                            .toList()
                                                                            .join(
                                                                              ' + ',
                                                                            )
                                                                        : '-'
                                                                    : item.productVariants !=
                                                                            null
                                                                        ? item
                                                                            .productVariants!
                                                                            .map((e) =>
                                                                                e.productVariantId)
                                                                            .toList()
                                                                            .join(' + ')
                                                                        : '-',
                                                                cellKey:
                                                                    'resources',
                                                              ),
                                                            ]);
                                                          },
                                                        ).toList(), // You can replace this with actual data for each cycle
                                                        leftColumnWidth: 130,
                                                        rightColumnWidth:
                                                            headerList.length *
                                                                17 *
                                                                6,
                                                        height: 6 * 57,
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                              // Add other widgets or components to display cycle-specific data here
                                            ],
                                          )
                                        : const Offstage()
                                    : const Offstage(),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }

  FormGroup buildForm() {
    return fb.group(<String, Object>{});
  }
}
