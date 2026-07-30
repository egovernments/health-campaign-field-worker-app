import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../utils/constants.dart';

class DownloadSpinnerContent extends StatelessWidget {
  final String title;

  const DownloadSpinnerContent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Lottie.asset(
            Constants.downloadAnimation,
            height: MediaQuery.of(context).size.height * 0.1,
          ),
        ),
        Center(
          child: Text(
            title,
            style: Theme.of(context).digitTextTheme(context).headingM.copyWith(
                  color: Theme.of(context).colorTheme.primary.primary2,
                ),
          ),
        ),
      ],
    );
  }
}
