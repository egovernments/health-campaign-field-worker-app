import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/facility.dart';
import '../../blocs/inventory_listener.dart';

class FacilityBlocWrapper extends StatelessWidget {
  final Widget child;
  final String projectId;

  const FacilityBlocWrapper({
    super.key,
    required this.child,
    required this.projectId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FacilityBloc>(
      create: (_) => FacilityBloc(
        inventorySingleton: InventorySingleton(),
        const FacilityEmptyState(),
      )..add(FacilityLoadForProjectEvent(projectId: projectId)),
      child: child,
    );
  }
}
