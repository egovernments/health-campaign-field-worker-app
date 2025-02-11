import 'package:auto_route/auto_route.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/date_utils.dart';
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
import '../../utils/component_mapper/household_details_component_mapper.dart';
import '../../utils/constants.dart';
import '../../utils/convert_to_map.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/models/widget_config_model.dart';
import '../../utils/utils.dart';
import '../../widgets/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/showcase/config/showcase_constants.dart';
import '../../widgets/showcase/showcase_button.dart';

@RoutePage()
class HouseHoldDetailsPage extends LocalizedStatefulWidget {
  final List<RegistrationDeliveryFormConfig>? widgetConfig;

  const HouseHoldDetailsPage({
    this.widgetConfig,
    super.key,
    super.appLocalizations,
  });

  @override
  State<HouseHoldDetailsPage> createState() => HouseHoldDetailsPageState();
}

class HouseHoldDetailsPageState extends LocalizedState<HouseHoldDetailsPage> {
  static const dateOfRegistrationKey = 'dateOfRegistration';
  static const memberCountKey = 'memberCount';
  static const pregnantWomenCountKey = 'pregnantWomenCount';
  static const childrenCountKey = 'childrenCount';
  HouseholdDetailsComponentMapper mapper = HouseholdDetailsComponentMapper();

  @override
  void initState() {
    if (widget.widgetConfig != null) {
      final converter = FieldConverter(widget.widgetConfig);
      mapper.configs = converter.convertWidgetConfigToJsonByName(HouseHoldDetailsRoute.name)!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bloc = context.read<BeneficiaryRegistrationBloc>();
    final router = context.router;

    return Scaffold(
      body: ReactiveFormBuilder(
        form: () => mapper.buildForm(bloc.state, localizations),
        builder: (context, form, child) {
          int pregnantWomen = form.control(pregnantWomenCountKey).value;
          int children = form.control(childrenCountKey).value;
          int memberCount = form.control(memberCountKey).value;
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
                      List<AdditionalField> fields = [];
                      for (var component in mapper.configs["components"]) {
                        for (var fieldConfig in component["attributes"]) {
                          var key = fieldConfig["name"];
                          // Check if the field has dependencies
                          if (evaluateDependencies(form, fieldConfig)) {
                            validate(form, key, fieldConfig, setState);
                            if (fieldConfig['type'] == 'additionalField' && fieldConfig['isEnabled'] == true) {
                              var val = form.control(key).value ?? '';
                              fields.add(AdditionalField(
                                key,
                                val is List ? val.join("|").toString() : val.toString(),
                              ));
                            }
                          }
                        }
                      }
                      form.markAllAsTouched();
                      if (!form.valid) return;

                      final memberCount =
                          form.control(memberCountKey).value as int;

                      final dateOfRegistration =
                          form.control(dateOfRegistrationKey).value as DateTime;
                      //[TODO: Use pregnant women form value based on project config
                      final pregnantWomen =
                          form.control(pregnantWomenCountKey).value as int;
                      final children =
                          form.control(childrenCountKey).value as int;

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
                              additionalFields: HouseholdAdditionalFields(
                                  version: 1, fields: fields),
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
                                      ...fields,
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
                                      ...fields,
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
                    child: Column(
                      children: mapper.buildWidgetsFromConfig(
                          WidgetConfigModel(
                            config: mapper.configs,
                            form: form,
                            localizations: localizations,
                          ),
                          context),
                    ),
                  )
                ],
              );
            },
          );
        },
      ),
    );
  }
}
