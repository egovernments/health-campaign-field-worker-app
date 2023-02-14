import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:flutter/material.dart';

class ToastHelper extends StatefulWidget {
  const ToastHelper({super.key});

  @override
  State<StatefulWidget> createState() {
    return ToastHelperState();
  }
}

class ToastHelperState extends State<ToastHelper> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final theme = Theme.of(context);
      DigitToast.show(context,
          options: DigitToastOptions('Failed to Login', true, theme));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
