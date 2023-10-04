import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../blocs/project/project.dart';
import '../../../models/entities/product_variant.dart';
import '../../../utils/i18_key_constants.dart' as i18;

// This function builds a table with the given data and headers
Widget buildTableContent(
  DeliverInterventionState deliverInterventionState,
  BuildContext context,
  List<TableHeader> headerListResource,
  List<ProductVariantModel>? variant,
) {
  // Calculate the current cycle. If deliverInterventionState.cycle is negative, set it to 0.
  final currentCycle =
      deliverInterventionState.cycle >= 0 ? deliverInterventionState.cycle : 0;

  // Calculate the current dose. If deliverInterventionState.dose is negative, set it to 0.
  final currentDose =
      deliverInterventionState.dose >= 0 ? deliverInterventionState.dose : 0;
  final localizations = AppLocalizations.of(context);

  return SizedBox(
    // [TODO - need to set the height of the card based on the number of items]
    height: 280,
    width: 500,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DigitTableCard(
          element: {
            localizations.translate(
              i18.beneficiaryDetails.beneficiaryAge,
            ): "2",
          },
        ),
        // const Divider(),
        // BlocBuilder to get project data based on the current cycle and dose
        BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, projectState) {
            final item = projectState.projectType!.cycles![currentCycle - 1]
                .deliveries![currentDose - 1];

            // Build the DigitTable with the data
            return DigitTable(
              headerList: headerListResource,
              tableData: [
                ...item.productVariants!.map(
                  (e) {
                    // Retrieve the SKU value for the product variant.
                    final value = variant!
                        .firstWhere(
                          (element) => element.id == e.productVariantId,
                        )
                        .sku;

                    return TableDataRow([
                      // Display the dose information in the first column if it's the first row,
                      // otherwise, display an empty cell.

                      item.productVariants?.indexOf(e) == 0
                          ? TableData(
                              'Dose ${deliverInterventionState.dose}',
                              cellKey: 'dose',
                            )
                          : TableData(''),
                      // Display the SKU value in the second column.
                      TableData(
                        localizations.translate(value.toString()),
                        cellKey: 'resources',
                      ),
                    ]);
                  },
                ),
              ],
              leftColumnWidth: 130,
              rightColumnWidth: headerListResource.length * 20 * 5,
              height: ((item.productVariants ?? []).length + 1) * 60,
            );
          },
        ),
      ],
    ),
  );
}
