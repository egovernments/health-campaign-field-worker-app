import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/widgets/component_wrapper/facility_bloc_wrapper.dart';
import 'package:inventory_management/widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../blocs/record_stock.dart';

@RoutePage()
class RecordStockWrapperPage extends StatelessWidget
    implements AutoRouteWrapper {
  final StockRecordEntryType type;

  const RecordStockWrapperPage({
    super.key,
    required this.type,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    if (InventorySingleton().projectId.isEmpty) {
      return const Center(
        child: Text('No project selected'),
      );
    } else {
      return FacilityBlocWrapper(
        projectId: InventorySingleton().projectId,
        child: ProductVariantBlocWrapper(
          projectId: InventorySingleton().projectId,
          child: BlocProvider(
            create: (_) => RecordStockBloc(
              RecordStockCreateState(
                entryType: type,
                projectId: InventorySingleton().projectId,
              ),
            ),
            child: this,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
