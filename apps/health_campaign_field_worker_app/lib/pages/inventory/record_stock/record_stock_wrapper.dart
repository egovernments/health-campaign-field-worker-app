import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/project/project.dart';
import '../../../blocs/record_stock/record_stock.dart';
import '../../../models/data_model.dart';
import '../../../router/app_router.dart';
import '../../../utils/extensions/extensions.dart';
import '../../../widgets/boundary_selection_wrapper.dart';
import '../../../widgets/component_wrapper/facility_bloc_wrapper.dart';
import '../../../widgets/component_wrapper/product_variant_bloc_wrapper.dart';

class RecordStockWrapperPage extends StatelessWidget with AutoRouteWrapper {
  final StockRecordEntryType type;

  const RecordStockWrapperPage({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BoundarySelectionWrapper(
      child: AutoRouter(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    final stockRepository = context.repository<StockModel, StockSearchModel>();

    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, projectState) {
        const noProjectSelected = Center(
          child: Text('No project selected'),
        );

        if (projectState.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        final selectedProject = projectState.selectedProject;

        if (selectedProject == null) {
          return noProjectSelected;
        }

        final projectId = selectedProject.id;

        return FacilityBlocWrapper(
          child: ProductVariantBlocWrapper(
            child: BlocProvider(
              create: (_) => RecordStockBloc(
                RecordStockCreateState(
                  entryType: type,
                  projectId: projectId,
                ),
                stockRepository: stockRepository,
              ),
              child: this,
            ),
          ),
        );
      },
    );
  }
}
