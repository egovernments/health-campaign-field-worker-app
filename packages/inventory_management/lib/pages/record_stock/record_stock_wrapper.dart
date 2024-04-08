// Importing necessary packages and modules
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/blocs/inventory_listener.dart';
import 'package:inventory_management/widgets/component_wrapper/facility_bloc_wrapper.dart';
import 'package:inventory_management/widgets/component_wrapper/product_variant_bloc_wrapper.dart';
import '../../blocs/record_stock.dart';

// This class is a wrapper for the RecordStock page.
// It is a stateless widget that implements the AutoRouteWrapper interface.
// It takes a StockRecordEntryType as a parameter, which determines the type of stock record to be created.
@RoutePage()
class RecordStockWrapperPage extends StatelessWidget
    implements AutoRouteWrapper {
  final StockRecordEntryType type;

  // Constructor for the RecordStockWrapperPage class.
  // It takes a StockRecordEntryType and a key as parameters.
  const RecordStockWrapperPage({
    super.key,
    required this.type,
  });

  // This method is part of the AutoRouteWrapper interface.
  // It returns the widget that should be displayed when the route is navigated to.
  // If no project is selected, it returns a Center widget with a Text widget displaying an error message.
  // Otherwise, it returns a FacilityBlocWrapper widget that wraps a ProductVariantBlocWrapper widget, which in turn wraps a BlocProvider widget.
  // The BlocProvider widget provides a RecordStockBloc to the widget tree.
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
              inventorySingleton: InventorySingleton(),
            ),
            child: this,
          ),
        ),
      );
    }
  }

  // This method overrides the build method of the StatelessWidget class.
  // It returns an AutoRouter widget, which handles routing for the application.
  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}