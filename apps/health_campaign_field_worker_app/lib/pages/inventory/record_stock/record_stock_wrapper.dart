import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/project/project.dart';
import '../../../blocs/record_stock/record_stock.dart';
import '../../../data/network_manager.dart';
import '../../../models/data_model.dart';
import '../../../widgets/facility_wrapper/facility_wrapper.dart';

class RecordStockWrapperPage extends StatelessWidget {
  final StockRecordEntryType type;

  const RecordStockWrapperPage({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = context.read<NetworkManager>();
    final stockRepository = manager.repository<StockModel, StockSearchModel>(
      context,
    );

    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, projectState) {
        const noProjectSelected = Center(
          child: Text('No project selected'),
        );

        return projectState.maybeWhen(
          orElse: () => noProjectSelected,
          loading: () => const Center(child: CircularProgressIndicator()),
          fetched: (projects, selectedProject) {
            final projectId = selectedProject?.id;

            if (projectId == null) {
              return noProjectSelected;
            }

            if (selectedProject == null) {
              return const Center(
                child: Text('Project not selected'),
              );
            }

            final facilityRepository = context
                .read<NetworkManager>()
                .repository<FacilityModel, FacilitySearchModel>(context);

            final projectFacilityRepository = context
                .read<NetworkManager>()
                .repository<ProjectFacilityModel, ProjectFacilitySearchModel>(
                  context,
                );

            return FacilityBlocWrapper(
              child: BlocProvider(
                create: (_) => RecordStockBloc(
                  RecordStockCreateState(
                    entryType: type,
                    projectId: projectId,
                  ),
                  stockRepository: stockRepository,
                ),
                child: const AutoRouter(),
              ),
            );
          },
        );
      },
    );
  }
}
