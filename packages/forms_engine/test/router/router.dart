import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/initial.dart';
import '../pages/forms.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: InitialPage, initial: true),
    AutoRoute(page: FormsPage, path: 'forms/:pageName'),
  ],
)
class AppRouter extends _$AppRouter {}
