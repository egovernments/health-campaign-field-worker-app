import 'package:collection/collection.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/widgets/atoms/digit_divider.dart';
import 'package:digit_ui_components/widgets/atoms/table_cell.dart';
import 'package:digit_ui_components/widgets/molecules/digit_table.dart';
import 'package:flutter/material.dart';
import 'package:registration_delivery/blocs/app_localization.dart';
import 'package:registration_delivery/registration_delivery.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../../utils/utils.dart';
import '../../../widgets/table_card/table_card.dart';

// This function builds a table with the given data and headers
Widget buildTableContent(
  DeliverInterventionState deliverInterventionState,
  BuildContext context,
  List<ProductVariantModel>? variant,
  IndividualModel? individualModel,
  HouseholdModel? householdModel,
) {
  // Calculate the current cycle. If deliverInterventionState.cycle is negative, set it to 0.
  final currentCycle =
      deliverInterventionState.cycle >= 0 ? deliverInterventionState.cycle : 0;

  // Calculate the current dose. If deliverInterventionState.dose is negative, set it to 0.
  final currentDose =
      deliverInterventionState.dose >= 0 ? deliverInterventionState.dose : 0;
  final localizations = RegistrationDeliveryLocalization.of(context);

  // Defining a list of table headers for resource popup
  final columnListResource = [
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
      projectType.cycles?[currentCycle - 1].deliveries?[currentDose - 1];

  final matchedDoses =
      fetchProductVariant(item, individualModel, householdModel) ?? [];
  final productVariants =
      matchedDoses.expand((e) => e.productVariants ?? []).toList();
  final numRows = productVariants?.length ?? 0;
  const rowHeight = 84;
  const paddingHeight = (spacer2 * 2);
  final containerHeight = (numRows + 1) * rowHeight + (paddingHeight * 2);
  const columnWidth = 150.0;
  const cellHeight = 59.5;

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
              ): matchedDoses.isNotEmpty
                  ? matchedDoses
                      .map((dose) => dose.condition)
                      .where((condition) => condition != null)
                      .map((condition) => localizations.translate(condition!))
                      .join(' `${localizations.translate(i18.beneficiaryDetails.addValueText)}` ')
                  : null,
            },
          ),
        ),
        const DigitDivider(),
        const SizedBox(
          height: spacer4,
        ),
        // Build the DigitTable with the data
        if (matchedDoses.isNotEmpty && matchedDoses[0].productVariants != null)
          DigitTable(
            enableBorder: false,
            withRowDividers: false,
            withColumnDividers: false,
            showSelectedState: false,
            showPagination: false,
            columns: columnListResource,
            rows: [
              // for (int i = 0; i < matchedDoses.length; i++) ...[
              for (int j = 0; j < productVariants.length; j++)
                DigitTableRow(tableRow: [
                  // Show dose label only for first row of each dose
                  j == 0
                      ? DigitTableData(
                          '${localizations.translate(i18.deliverIntervention.dose)} ${j + 1}',
                          cellKey: 'dose',
                        )
                      : DigitTableData('', cellKey: ''),
                  // Show quantity and SKU
                  DigitTableData(
                    '${productVariants[j].quantity} - ${localizations.translate(
                      variant
                              ?.firstWhereOrNull((v) =>
                                  v.id == productVariants[j].productVariantId)
                              ?.sku ??
                          '',
                    )}',
                    cellKey: 'resources',
                  ),
                ]),
            ],
            //],
          )
        else
          Text(localizations.translate(i18.common.noProjectSelected))
      ],
    ),
  );
}
