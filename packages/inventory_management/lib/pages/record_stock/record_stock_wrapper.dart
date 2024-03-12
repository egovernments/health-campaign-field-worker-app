import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/pages/record_stock/stock_details.dart';
import 'package:inventory_management/pages/record_stock/warehouse_details.dart';

import '../../blocs/facility.dart';
import '../../blocs/product_variant.dart';
import '../../blocs/record_stock.dart';
import '../../models/entities/project_resource.dart';

class RecordStockWrapperPage extends StatelessWidget {
  final StockRecordEntryType type;
  final String projectId;

  bool showStockDetailsPage = false;

  RecordStockWrapperPage(
      {super.key,
      required this.type,
      required this.projectId,
      this.showStockDetailsPage = false});

  @override
  Widget build(BuildContext context) {
    if (projectId.isEmpty) {
      return const Center(
        child: Text('No project selected'),
      );
    } else {
      return BlocProvider<FacilityBloc>(
          create: (_) => FacilityBloc(
                const FacilityLoadingState(),
              )..add(
                  FacilityEvent.loadForProjectId(
                    projectId: projectId,
                  ),
                ),
          child: BlocProvider<ProductVariantBloc>(
              create: (_) => ProductVariantBloc(
                    const ProductVariantLoadingState(),
                  )..add(
                      ProductVariantEvent.load(
                          query: ProjectResourceSearchModel(
                        projectId: projectId,
                      )),
                    ),
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
              )));
    }
  }
}
