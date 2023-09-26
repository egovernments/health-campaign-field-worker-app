import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_table_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/delivery_intervention/deliver_intervention.dart';
import '../../../blocs/localization/app_localization.dart';
import '../../../blocs/project/project.dart';
import '../../../models/entities/product_variant.dart';
import '../../../utils/i18_key_constants.dart' as i18;

Widget buildTableContent(
  DeliverInterventionState deliverInterventionState,
  BuildContext context,
  List<TableHeader> headerListResource,
  List<ProductVariantModel>? variant,
) {
  final currentCycle =
      deliverInterventionState.cycle >= 0 ? deliverInterventionState.cycle : 0;
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
        BlocBuilder<ProjectBloc, ProjectState>(
          builder: (context, projectState) {
            final item = projectState
                .projectType!
                .cycles![currentCycle == 0 ? currentCycle : currentCycle - 1]
                .deliveries![currentDose];

            return DigitTable(
              headerList: headerListResource,
              tableData: [
                ...item.productVariants!.map(
                  (e) {
                    final value = variant!
                        .firstWhere(
                          (element) => element.id == e.productVariantId,
                        )
                        .sku;

                    return TableDataRow([
                      item.productVariants?.indexOf(e) == 0
                          ? TableData(
                              'Dose ${projectState.projectType!.cycles![currentCycle == 0 ? currentCycle : currentCycle - 1].deliveries!.indexOf(item) + 1}',
                              cellKey: 'dose',
                            )
                          : TableData(''),
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
              height: MediaQuery.of(context).size.height / 5,
            );
          },
        ),
      ],
    ),
  );
}
