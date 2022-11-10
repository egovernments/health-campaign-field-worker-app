import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forms_engine/blocs/walkthrough/walkthrough.dart';
import 'package:forms_engine/forms_engine.dart';

Future<void> pumpRouterApp(
  WidgetTester tester,
  RootStackRouter router, {
  String? initialLink,
}) {
  return tester
      .pumpWidget(MultiBlocProvider(
        providers: [
          BlocProvider<WalkthroughBloc>(
            create: (BuildContext context) => WalkthroughBloc(
              const WalkthroughState(
                walkthroughData: SchemaObject(name: '', version: 1),
              ),
            ),
          ),
        ],
        child: MaterialApp.router(
          routeInformationParser: router.defaultRouteParser(),
          routerDelegate: router.delegate(initialDeepLink: initialLink),
        ),
      ))
      .then((_) => tester.pumpAndSettle());
}

void expectCurrentPage(StackRouter router, String name) {
  expect(router.current.name, name);
  expect(find.text(name), findsOneWidget);
}

void expectTopPage(StackRouter router, String name) {
  expect(router.topRoute.name, name);
  expect(find.text(name), findsOneWidget);
}
