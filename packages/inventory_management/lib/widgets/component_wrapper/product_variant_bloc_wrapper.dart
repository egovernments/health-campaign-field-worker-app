import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:digit_data_model/data_model.dart';
import '../../blocs/inventory_listener.dart';
import '../../blocs/product_variant.dart';

class ProductVariantBlocWrapper extends StatelessWidget {
  final Widget child;
  final String projectId;

  const ProductVariantBlocWrapper({
    super.key,
    required this.child,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductVariantBloc>(
      create: (_) => ProductVariantBloc(
        const ProductVariantEmptyState(),
        inventorySingleton: InventorySingleton(),
      )..add(
          ProductVariantLoadEvent(
            query: ProjectResourceSearchModel(
              projectId: projectId,
            ),
          ),
        ),
      child: child,
    );
  }
}
