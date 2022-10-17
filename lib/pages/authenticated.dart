import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AuthenticatedPageWrapper extends StatelessWidget {
  const AuthenticatedPageWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Drawer(),
      body: const AutoRouter(),
    );
  }
}
