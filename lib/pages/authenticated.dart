import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/forms_engine.dart';
import 'package:health_campaigns_flutter/data/fake_schema.dart';

class AuthenticatedPageWrapper extends StatelessWidget {
  const AuthenticatedPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => FormsBloc(fakeSchema)..add(const FormsLoadEvent()),
          ),
        ],
        child: const AutoRouter(),
      ),
    );
  }
}
