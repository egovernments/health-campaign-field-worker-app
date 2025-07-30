import 'package:auto_route/annotations.dart';
import 'package:digit_crud_bloc/bloc/crud_bloc.dart';
import 'package:digit_crud_bloc/utils/utils.dart';
import 'package:digit_flow_builder/widgets/localized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'flow_builder.dart';

@RoutePage()
class FlowBuilderHomePage extends LocalizedStatefulWidget {
  final String pageName;

  const FlowBuilderHomePage({super.key, required this.pageName});

  @override
  State<FlowBuilderHomePage> createState() => _FlowBuilderHomePageState();
}

class _FlowBuilderHomePageState extends State<FlowBuilderHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final config = FlowRegistry.getByName(widget.pageName);
    if (config == null) return const Center(child: Text('Page not found'));

    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) {
          return CrudBloc(
            service: CrudBlocSingleton().crudService,
          );
        },
      ),
    ], child: ScreenBuilder(config: config));
  }
}
