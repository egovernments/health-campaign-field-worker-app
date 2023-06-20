import 'package:flutter/material.dart';

class CrashButton extends StatelessWidget {
  const CrashButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => OutlinedButton(
        onPressed: () {
          throw Exception('Voluntary Crash');
        },
        child: const Center(child: Text('Test Crash')),
      );
}
