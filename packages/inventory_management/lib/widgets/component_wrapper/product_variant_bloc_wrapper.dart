import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/product_variant.dart';
import '../../models/entities/product_variant.dart';
import '../../models/entities/project_resource.dart';

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
      )..add(
          ProductVariantLoadEvent(
            query: ProjectResourceSearchModel(
              projectId: projectId,
            ),
          ),
        ),
      lazy: false,
      child: child,
    );
  }
}
