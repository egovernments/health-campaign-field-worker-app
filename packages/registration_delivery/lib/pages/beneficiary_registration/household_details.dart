import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/atoms/text_block.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:registration_delivery/blocs/household_overview/household_overview.dart';
import 'package:registration_delivery/blocs/search_households/search_households.dart';
import 'package:registration_delivery/models/entities/additional_fields_type.dart';
import 'package:registration_delivery/utils/extensions/extensions.dart';

import '../../blocs/beneficiary_registration/beneficiary_registration.dart';
import '../../models/entities/household.dart';
import '../../router/registration_delivery_router.gm.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/models/widget_config_model.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class HouseHoldDetailsPage extends LocalizedStatefulWidget {
  final Map<String, Map<String, dynamic>> widgetConfig;

  HouseHoldDetailsPage({
    Map<String, Map<String, dynamic>>? widgetConfig,
    super.key,
    super.appLocalizations,
  }) : widgetConfig = widgetConfig ??
            {
              'dateOfRegistration': {
                'isEnabled': true,
                'readOnly': true,
                'isRequired': true,
                'order': 4,
              },
              'memberCount': {
                'isEnabled': true,
                'readOnly': false,
                'isRequired': true,
                'order': 1,
              },
              'pregnantWomenCount': {
                'isEnabled': true,
                'readOnly': false,
                'isRequired': true,
                'order': 2,
              },
              'childrenCount': {
                'isEnabled': true,
                'readOnly': false,
                'isRequired': false,
                'order': 4,
              },
            };

  @override
  State<HouseHoldDetailsPage> createState() => HouseHoldDetailsPageState();
}

class HouseHoldDetailsPageState extends LocalizedState<HouseHoldDetailsPage> {
  static const _dateOfRegistrationKey = 'dateOfRegistration';
  static const _memberCountKey = 'memberCount';
  static const _pregnantWomenCountKey = 'pregnantWomenCount';
  static const _childrenCountKey = 'childrenCount';

  List<Widget> buildWidgetsFromConfig(WidgetConfigModel model) {
    List<Widget> widgets = [];

    // Sort the config keys by the 'order' key
    var sortedKeys = model.config.keys.toList();
    sortedKeys.sort(
        (a, b) => model.config[a]['order'].compareTo(model.config[b]['order']));

    for (var key in sortedKeys) {
      var fieldConfig = model.config[key];

      if (fieldConfig['isEnabled'] == true) {
        Widget widget;

        // Generate the widget based on the fieldConfig['type'] using a switch case
        switch (key) {
          case _dateOfRegistrationKey:
            widget = householdDetailsShowcaseData.dateOfRegistration.buildWith(
              child: DigitDateFormPicker(
                isEnabled: (fieldConfig['readOnly'] ?? false) != true,
                formControlName: _dateOfRegistrationKey,
                label: localizations.translate(
                  i18.householdDetails.dateOfRegistrationLabel,
                ),
                isRequired: fieldConfig['isRequired'] ?? false,
                confirmText: localizations.translate(
                  i18.common.coreCommonOk,
                ),
                cancelText: localizations.translate(
                  i18.common.coreCommonCancel,
                ),
              ),
            );
            break;
          case _memberCountKey:
            int pregnantWomen =
                model.form.control(_pregnantWomenCountKey).value;
            int children = model.form.control(_childrenCountKey).value;
            widget = householdDetailsShowcaseData
                .numberOfMembersLivingInHousehold
                .buildWith(
              child: AbsorbPointer(
                absorbing: fieldConfig['readOnly'] ?? false,
                child: Opacity(
                  opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
                  child: DigitIntegerFormPicker(
                    minimum: children + pregnantWomen != 0
                        ? children + pregnantWomen
                        : 1,
                    maximum: 30,
                    onChange: () {
                      int pregnantWomen =
                          model.form.control(_pregnantWomenCountKey).value;
                      int children =
                          model.form.control(_childrenCountKey).value;
                      int memberCount =
                          model.form.control(_memberCountKey).value;
                      if (memberCount <= pregnantWomen + children) {
                        model.form.control(_memberCountKey).value =
                            (children + pregnantWomen);
                      }
                    },
                    form: model.form,
                    formControlName: _memberCountKey,
                    label: localizations.translate(
                      i18.householdDetails.noOfMembersCountLabel,
                    ),
                    incrementer: true,
                  ),
                ),
              ),
            );
            break;
          case _pregnantWomenCountKey:
            widget = householdDetailsShowcaseData
                .numberOfPregnantWomenInHousehold
                .buildWith(
              child: AbsorbPointer(
                absorbing: fieldConfig['readOnly'] ?? false,
                child: Opacity(
                  opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
                  child: DigitIntegerFormPicker(
                    minimum: 0,
                    maximum: 10,
                    onChange: () {
                      int pregnantWomen =
                          model.form.control(_pregnantWomenCountKey).value;
                      int children =
                          model.form.control(_childrenCountKey).value;
                      int memberCount =
                          model.form.control(_memberCountKey).value;
                      model.form.control(_memberCountKey).value =
                          memberCount < (children + pregnantWomen)
                              ? children + pregnantWomen
                              : memberCount;
                    },
                    form: model.form,
                    formControlName: _pregnantWomenCountKey,
                    label: '${localizations.translate(
                      i18.householdDetails.noOfPregnantWomenCountLabel,
                    )}${fieldConfig['isRequired'] ?? false ? '*' : ''}',
                    incrementer: true,
                  ),
                ),
              ),
            );
            break;
          case _childrenCountKey:
            widget = householdDetailsShowcaseData
                .numberOfChildrenBelow5InHousehold
                .buildWith(
              child: AbsorbPointer(
                absorbing: fieldConfig['readOnly'] ?? false,
                child: Opacity(
                  opacity: fieldConfig['readOnly'] ?? false ? 0.5 : 1,
                  child: DigitIntegerFormPicker(
                    minimum: 0,
                    maximum: 20,
                    onChange: () {
                      int pregnantWomen =
                          model.form.control(_pregnantWomenCountKey).value;
                      int children =
                          model.form.control(_childrenCountKey).value;
                      int memberCount =
                          model.form.control(_memberCountKey).value;
                      model.form.control(_memberCountKey).value =
                          memberCount <= (children + pregnantWomen)
                              ? children + pregnantWomen
                              : memberCount;
                    },
                    form: model.form,
                    formControlName: _childrenCountKey,
                    label: '${localizations.translate(
                      i18.householdDetails.noOfChildrenBelow5YearsLabel,
                    )}${fieldConfig['isRequired'] ?? false ? '*' : ''}',
                    incrementer: true,
                  ),
                ),
              ),
            );
            break;
          default:
            throw Exception("Unsupported widget type: ${key}");
        }

        widgets.add(widget);
      }
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => buildForm(bloc.state),
        builder: (context, form, child) {
          int pregnantWomen = form.control(_pregnantWomenCountKey).value;
          int children = form.control(_childrenCountKey).value;
          int memberCount = form.control(_memberCountKey).value;
          return BlocConsumer<BeneficiaryRegistrationBloc,
              BeneficiaryRegistrationState>(
            listener: (context, state) {
              if (state is BeneficiaryRegistrationPersistedState &&
                  state.isEdit) {
                final overviewBloc = context.read<HouseholdOverviewBloc>();

                overviewBloc.add(
                  HouseholdOverviewReloadEvent(
                    projectId:
                        RegistrationDeliverySingleton().projectId.toString(),
                    projectBeneficiaryType:
                        RegistrationDeliverySingleton().beneficiaryType ??
                            BeneficiaryType.household,
                  ),
                );
                HouseholdMemberWrapper memberWrapper =
                    overviewBloc.state.householdMemberWrapper;
                final route = router.parent() as StackRouter;
                route.popUntilRouteWithName(SearchBeneficiaryRoute.name);
                route.push(BeneficiaryWrapperRoute(wrapper: memberWrapper));
              }
            },
            builder: (context, registrationState) {
              return ScrollableContent(
                header: const Column(children: [
                  BackNavigationHelpHeaderWidget(
                    showHelp: false,
                    showcaseButton: ShowcaseButton(),
                  ),
                ]),
                enableFixedButton: true,
                footer: DigitCard(
                  margin: const EdgeInsets.fromLTRB(0, kPadding, 0, 0),
                  padding: const EdgeInsets.fromLTRB(kPadding, 0, kPadding, 0),
                  child: DigitElevatedButton(
                    onPressed: () {
                      form.markAllAsTouched();
                      if (!form.valid) return;

                      final memberCount =
                          form.control(_memberCountKey).value as int;

                      final dateOfRegistration = form
                          .control(_dateOfRegistrationKey)
                          .value as DateTime;
                      //[TODO: Use pregnant women form value based on project config
                      final pregnantWomen =
                          form.control(_pregnantWomenCountKey).value as int;
                      final children =
                          form.control(_childrenCountKey).value as int;

                      if (memberCount < (pregnantWomen + children)) {
                        DigitToast.show(context,
                            options: DigitToastOptions(
                                localizations.translate(
                                    i18.householdDetails.memberCountError),
                                true,
                                theme));
                      } else {
                        registrationState.maybeWhen(
                          orElse: () {
                            return;
                          },
                          create: (
                            addressModel,
                            householdModel,
                            individualModel,
                            projectBeneficiaryModel,
                            registrationDate,
                            searchQuery,
                            loading,
                            isHeadOfHousehold,
                          ) {
                            var household = householdModel;
                            household ??= HouseholdModel(
                              tenantId:
                                  RegistrationDeliverySingleton().tenantId,
                              clientReferenceId:
                                  householdModel?.clientReferenceId ??
                                      IdGen.i.identifier,
                              rowVersion: 1,
                              clientAuditDetails: ClientAuditDetails(
                                createdBy: RegistrationDeliverySingleton()
                                    .loggedInUserUuid!,
                                createdTime: context.millisecondsSinceEpoch(),
                                lastModifiedBy: RegistrationDeliverySingleton()
                                    .loggedInUserUuid,
                                lastModifiedTime:
                                    context.millisecondsSinceEpoch(),
                              ),
                              auditDetails: AuditDetails(
                                createdBy: RegistrationDeliverySingleton()
                                    .loggedInUserUuid!,
                                createdTime: context.millisecondsSinceEpoch(),
                                lastModifiedBy: RegistrationDeliverySingleton()
                                    .loggedInUserUuid,
                                lastModifiedTime:
                                    context.millisecondsSinceEpoch(),
                              ),
                            );

                            household = household.copyWith(
                                rowVersion: 1,
                                tenantId:
                                    RegistrationDeliverySingleton().tenantId,
                                clientReferenceId:
                                    householdModel?.clientReferenceId ??
                                        IdGen.i.identifier,
                                memberCount: memberCount,
                                clientAuditDetails: ClientAuditDetails(
                                  createdBy: RegistrationDeliverySingleton()
                                      .loggedInUserUuid
                                      .toString(),
                                  createdTime: context.millisecondsSinceEpoch(),
                                  lastModifiedBy:
                                      RegistrationDeliverySingleton()
                                          .loggedInUserUuid
                                          .toString(),
                                  lastModifiedTime:
                                      context.millisecondsSinceEpoch(),
                                ),
                                auditDetails: AuditDetails(
                                  createdBy: RegistrationDeliverySingleton()
                                      .loggedInUserUuid
                                      .toString(),
                                  createdTime: context.millisecondsSinceEpoch(),
                                  lastModifiedBy:
                                      RegistrationDeliverySingleton()
                                          .loggedInUserUuid
                                          .toString(),
                                  lastModifiedTime:
                                      context.millisecondsSinceEpoch(),
                                ),
                                address: addressModel,
                                additionalFields: HouseholdAdditionalFields(
                                    version: 1,
                                    fields: [
                                      //[TODO: Use pregnant women form value based on project config
                                      ...?householdModel
                                          ?.additionalFields?.fields
                                          .where((e) =>
                                              e.key !=
                                                  AdditionalFieldsType
                                                      .pregnantWomen
                                                      .toValue() &&
                                              e.key !=
                                                  AdditionalFieldsType.children
                                                      .toValue()),
                                      AdditionalField(
                                        AdditionalFieldsType.pregnantWomen
                                            .toValue(),
                                        pregnantWomen,
                                      ),
                                      AdditionalField(
                                        AdditionalFieldsType.children.toValue(),
                                        children,
                                      )
                                    ]));

                            bloc.add(
                              BeneficiaryRegistrationSaveHouseholdDetailsEvent(
                                household: household,
                                registrationDate: dateOfRegistration,
                              ),
                            );
                            context.router.push(
                              IndividualDetailsRoute(isHeadOfHousehold: true),
                            );
                          },
                          editHousehold: (
                            addressModel,
                            householdModel,
                            individuals,
                            registrationDate,
                            projectBeneficiaryModel,
                            loading,
                            isHeadOfHousehold,
                          ) {
                            var household = householdModel.copyWith(
                                memberCount: memberCount,
                                address: addressModel,
                                clientAuditDetails: (householdModel
                                                .clientAuditDetails
                                                ?.createdBy !=
                                            null &&
                                        householdModel.clientAuditDetails
                                                ?.createdTime !=
                                            null)
                                    ? ClientAuditDetails(
                                        createdBy: householdModel
                                            .clientAuditDetails!.createdBy,
                                        createdTime: householdModel
                                            .clientAuditDetails!.createdTime,
                                        lastModifiedBy:
                                            RegistrationDeliverySingleton()
                                                .loggedInUserUuid,
                                        lastModifiedTime: DateTime.now()
                                            .millisecondsSinceEpoch,
                                      )
                                    : null,
                                rowVersion: householdModel.rowVersion,
                                additionalFields: HouseholdAdditionalFields(
                                    version: householdModel
                                            .additionalFields?.version ??
                                        1,
                                    fields: [
                                      //[TODO: Use pregnant women form value based on project config
                                      ...?householdModel
                                          .additionalFields?.fields
                                          .where((e) =>
                                              e.key !=
                                                  AdditionalFieldsType
                                                      .pregnantWomen
                                                      .toValue() &&
                                              e.key !=
                                                  AdditionalFieldsType.children
                                                      .toValue()),
                                      AdditionalField(
                                        AdditionalFieldsType.pregnantWomen
                                            .toValue(),
                                        pregnantWomen,
                                      ),
                                      AdditionalField(
                                        AdditionalFieldsType.children.toValue(),
                                        children,
                                      )
                                    ]));

                            bloc.add(
                              BeneficiaryRegistrationUpdateHouseholdDetailsEvent(
                                household: household.copyWith(
                                  clientAuditDetails: (addressModel
                                                  .clientAuditDetails
                                                  ?.createdBy !=
                                              null &&
                                          addressModel.clientAuditDetails
                                                  ?.createdTime !=
                                              null)
                                      ? ClientAuditDetails(
                                          createdBy: addressModel
                                              .clientAuditDetails!.createdBy,
                                          createdTime: addressModel
                                              .clientAuditDetails!.createdTime,
                                          lastModifiedBy:
                                              RegistrationDeliverySingleton()
                                                  .loggedInUserUuid,
                                          lastModifiedTime:
                                              context.millisecondsSinceEpoch(),
                                        )
                                      : null,
                                ),
                                addressModel: addressModel.copyWith(
                                  clientAuditDetails: (addressModel
                                                  .clientAuditDetails
                                                  ?.createdBy !=
                                              null &&
                                          addressModel.clientAuditDetails
                                                  ?.createdTime !=
                                              null)
                                      ? ClientAuditDetails(
                                          createdBy: addressModel
                                              .clientAuditDetails!.createdBy,
                                          createdTime: addressModel
                                              .clientAuditDetails!.createdTime,
                                          lastModifiedBy:
                                              RegistrationDeliverySingleton()
                                                  .loggedInUserUuid,
                                          lastModifiedTime:
                                              context.millisecondsSinceEpoch(),
                                        )
                                      : null,
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: Center(
                      child: Text(
                        registrationState.mapOrNull(
                              editHousehold: (value) => localizations
                                  .translate(i18.common.coreCommonSave),
                            ) ??
                            localizations
                                .translate(i18.householdDetails.actionLabel),
                      ),
                    ),
                  ),
                ),
                slivers: [
                  SliverToBoxAdapter(
                    child: DigitCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextBlock(
                            padding: const EdgeInsets.only(top: kPadding),
                            heading: localizations.translate(
                              i18.householdDetails.householdDetailsLabel,
                            ),
                            headingStyle: theme.textTheme.displayMedium,
                            body: localizations.translate(
                              i18.householdDetails.householdDetailsDescription,
                            ),
                          ),
                          Column(
                              children: buildWidgetsFromConfig(
                                  WidgetConfigModel(
                                      config: widget.widgetConfig,
                                      form: form))),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  FormGroup buildForm(BeneficiaryRegistrationState state) {
    final household = state.mapOrNull(editHousehold: (value) {
      return value.householdModel;
    }, create: (value) {
      return value.householdModel;
    });

    final registrationDate = state.mapOrNull(
      editHousehold: (value) {
        return value.registrationDate;
      },
      create: (value) => DateTime.now(),
    );

    return fb.group(<String, Object>{
      _dateOfRegistrationKey:
          FormControl<DateTime>(value: registrationDate, validators: []),
      _memberCountKey: FormControl<int>(
        value: household?.memberCount ?? 1,
      ),
      _pregnantWomenCountKey: FormControl<int>(
        value: household?.additionalFields?.fields
                    .where((h) =>
                        h.key == AdditionalFieldsType.pregnantWomen.toValue())
                    .firstOrNull
                    ?.value !=
                null
            ? int.tryParse(household?.additionalFields?.fields
                    .where((h) =>
                        h.key == AdditionalFieldsType.pregnantWomen.toValue())
                    .firstOrNull
                    ?.value
                    .toString() ??
                '0')
            : 0,
      ),
      _childrenCountKey: FormControl<int>(
        value: household?.additionalFields?.fields
                    .where(
                        (h) => h.key == AdditionalFieldsType.children.toValue())
                    .firstOrNull
                    ?.value !=
                null
            ? int.tryParse(household?.additionalFields?.fields
                    .where(
                        (h) => h.key == AdditionalFieldsType.children.toValue())
                    .firstOrNull
                    ?.value
                    .toString() ??
                '0')
            : 0,
      )
    });
  }
}
