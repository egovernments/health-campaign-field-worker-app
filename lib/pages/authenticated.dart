import 'package:digit_components/digit_components.dart';
import 'package:health_campaigns_flutter/widgets/sidebar/side_bar.dart';
import 'package:location/location.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_engine/forms_engine.dart';
import 'package:health_campaigns_flutter/data/fake_schema.dart';

class AuthenticatedPageWrapper extends StatelessWidget {
  const AuthenticatedPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar();

    return Scaffold(
      appBar: appBar,
      drawer: Container(
        margin: const EdgeInsets.only(top: kToolbarHeight * 2),
        child: const Drawer(
          child: SideBar(),
        ),
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => FormsBloc(fakeSchema)..add(const FormsLoadEvent()),
          ),
          BlocProvider(
            create: (_) => LocationBloc(location: Location())
              ..add(const LoadLocationEvent()),
          ),
        ],
        child: const AutoRouter(),
      ),
    );
  }
}
