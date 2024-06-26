import 'package:digit_data_model/models/entities/product_variant.dart';
import 'package:digit_data_model/models/entities/project_resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventory_management/utils/extensions/extensions.dart';

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
    return BlocProvider<InventoryProductVariantBloc>(
      create: (_) => InventoryProductVariantBloc(
        productVariantDataRepository:
            context.repository<ProductVariantModel, ProductVariantSearchModel>(
                context),
        projectResourceDataRepository: context.repository<ProjectResourceModel,
            ProjectResourceSearchModel>(context),
      )..add(
          ProductVariantLoadEvent(
            query: ProjectResourceSearchModel(
              projectId: [projectId],
            ),
          ),
        ),
      child: child,
    );
  }
}
