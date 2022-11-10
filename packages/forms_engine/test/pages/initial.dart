import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/forms_engine.dart';

import '../fake_schema.dart';

class InitialPage extends StatelessWidget {
  const InitialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => FormsBloc(fakeSchema)..add(const FormsLoadEvent()),
        )
      ],
      child: const Text('Initial Screen'),
    ));
  }
}
