import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/pages/record_stock/stock_details.dart';
import 'package:inventory_management/pages/record_stock/warehouse_details.dart';
import 'package:inventory_management/widgets/component_wrapper/facility_bloc_wrapper.dart';
import 'package:inventory_management/widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../blocs/record_stock.dart';

class RecordStockWrapperPage extends StatelessWidget {
  final StockRecordEntryType type;
  final String projectId;

  const RecordStockWrapperPage({
    super.key,
    required this.type,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    if (projectId.isEmpty) {
      return const Center(
        child: Text('No project selected'),
      );
    } else {
      return FacilityBlocWrapper(
        projectId: projectId,
        child: ProductVariantBlocWrapper(
          projectId: projectId,
          child: BlocProvider<RecordStockBloc>(
            create: (_) {
              return RecordStockBloc(
                RecordStockCreateState(
                  entryType: type,
                  projectId: projectId,
                ),
              );
            },
            child: BlocBuilder<RecordStockBloc, RecordStockState>(
              builder: (context, state) {
                if (state is RecordStockCreateState) {
                  return state.facilityModel == null
                      ? WarehouseDetailsPage(entryType: type)
                      : StockDetailsPage(entryType: type);
                } else if (state is RecordStockPersistedState) {
                  return state.facilityModel == null
                      ? WarehouseDetailsPage(entryType: type)
                      : StockDetailsPage(entryType: type);
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      );
    }
  }
}
