import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/blocs/app_localization.dart';
import 'package:registration_delivery/blocs/registration_wrapper/registration_wrapper_bloc.dart';
import 'package:registration_delivery/registration_delivery.dart';
import 'package:registration_delivery/router/registration_delivery_router.gm.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/registration_component_keys.dart' as registration_keys;
import '../../../utils/utils.dart';
import '../../../widgets/table_card/table_card.dart';

// This function builds a table with the given data and headers
Widget buildTableContent(
    RegistrationWrapperState state,
    BuildContext context,
    List<ProductVariantModel>? variant,
    IndividualModel? individualModel,
    HouseholdModel? householdModel,
    ) {

  final pageKey = BeneficiaryDetailsRoute.name.replaceAll('Route', '');
  final beneficiaryDetailsTableConfig = RegistrationDeliverySingleton().templateConfigs?[pageKey]?.properties?[registration_keys.beneficiaryDetailsKeys.tableCardKey];

  final deliverInterventionState = state.deliveryWrapper;
  // Calculate the current cycle. If deliverInterventionState.cycle is negative, set it to 0.
  final currentCycle =
  ( deliverInterventionState?.cycle ??0) >= 0 ? deliverInterventionState?.cycle : 0;

  // Calculate the current dose. If deliverInterventionState.dose is negative, set it to 0.
  final currentDose =
  (deliverInterventionState?.dose??0) >= 0 ? deliverInterventionState?.dose : 0;
  final localizations = RegistrationDeliveryLocalization.of(context);

  // Defining a list of table headers for resource popup
  final columnListResource = beneficiaryDetailsTableConfig?.hidden != true && (beneficiaryDetailsTableConfig?.enums ?? []).isNotEmpty
      ? beneficiaryDetailsTableConfig?.enums?.map((header) => DigitTableColumn(
    header: localizations.translate(header['code']),
    cellValue: header['fieldKey'],
  ),).toList()
      : [
    DigitTableColumn(
      header: localizations.translate(i18.beneficiaryDetails.beneficiaryDose),
      cellValue: 'dose',
    ),
    DigitTableColumn(
      header:
      localizations.translate(i18.beneficiaryDetails.beneficiaryResources),
      cellValue: 'resources',
    ),
  ];

  // Calculate the height of the container based on the number of items in the table

  final ProjectTypeModel projectType =
  RegistrationDeliverySingleton().projectType!;
  final item =
  projectType.cycles?.firstWhere((c) => c.id == currentCycle).deliveries?.firstWhere((d) => d.id == currentDose);  //todo: need to check again for cycles

  return Container(
    padding: const EdgeInsets.only(
      left: spacer2,
      bottom: 0,
      right: spacer2,
      top: 0,
    ),
    width: MediaQuery.of(context).size.width / 1.25,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: spacer1),
          child: DigitTableCard(
            topPadding: const EdgeInsets.only(top: 0.0),
            fraction: 2.5,
            element: {
              localizations.translate(
                i18.beneficiaryDetails.beneficiaryAge,
              ): getProductVariant(item, individualModel, householdModel,
                  context)['criteria']
                  .condition !=
                  null
                  ? localizations.translate(getProductVariant(item,
                  individualModel, householdModel, context)!['criteria']
                  .condition!)
                  : null,
            },
          ),
        ),
        const DigitDivider(),
        const SizedBox(
          height: spacer4,
        ),
        // Build the DigitTable with the data
        if (getProductVariant(
            item, individualModel, householdModel, context)['criteria']
            .productVariants !=
            null)
          DigitTable(
            enableBorder: false,
            withRowDividers: false,
            withColumnDividers: false,
            showSelectedState: false,
            showPagination: false,
            columns: columnListResource ?? [
              DigitTableColumn(
                header: localizations.translate(i18.beneficiaryDetails.beneficiaryDose),
                cellValue: 'dose',
              ),
              DigitTableColumn(
                header:
                localizations.translate(i18.beneficiaryDetails.beneficiaryResources),
                cellValue: 'resources',
              ),
            ],
            rows: [
              ...getProductVariant(item, individualModel, householdModel,
                  context)!['criteria']
                  .productVariants!
                  .map(
                    (e) {
                  // Retrieve the SKU value for the product variant.
                  final value = variant
                      ?.firstWhereOrNull(
                        (element) => element.id == e.productVariantId,
                  )
                      ?.sku;
                  final quantity = e.quantity;

                  return DigitTableRow(tableRow: [
                    // Display the dose information in the first column if it's the first row,
                    // otherwise, display an empty cell.

                    getProductVariant(item, individualModel, householdModel,
                        context)['criteria']
                        .productVariants
                        ?.indexOf(e) ==
                        0
                        ? DigitTableData(
                      '${localizations.translate(columnListResource?.first.header ?? i18.deliverIntervention.dose)} ${deliverInterventionState?.dose}',
                      cellKey: 'dose',
                    )
                        : DigitTableData('', cellKey: ''),
                    // Display the SKU value in the second column.
                    DigitTableData(
                      '$quantity - ${localizations.translate(value.toString())}',
                      cellKey: 'resources',
                    ),
                  ]);
                },
              ),
            ],
          )
        else
          Text(localizations
              .translate(i18.deliverIntervention.checkForProductVariantsConfig))
      ],
    ),
  );
}

getProductVariant(ProjectCycleDelivery? item, IndividualModel? individualModel,
    HouseholdModel? householdModel, BuildContext context) {
  var result = (fetchProductVariant(item, individualModel, householdModel,
      context: context));

  return result;
}
