import 'dart:convert';
import 'package:digit_components/digit_components.dart';
import 'package:health_campaigns_flutter/data/fake_language_schema.dart';
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
    final List list = json.decode(fakeLanguageSchema);
    List<DigitRowCardModel> languageList =
        list.map((e) => DigitRowCardModel.fromJson(e)).toList();

    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DigitRowCard(
              onPressed: (data) {},
              list: languageList,
            ),
          ],
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
