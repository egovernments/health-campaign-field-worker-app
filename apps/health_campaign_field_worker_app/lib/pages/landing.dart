import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:digit_components/digit_components.dart';
import '../data/fake_language_schema.dart';
import 'login.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List list = json.decode(fakeLanguageSchema);
    List<DigitRowCardModel> languageList =
        list.map((e) => DigitRowCardModel.fromJson(e)).toList();

    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        color: theme.colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            DigitLanguageCard(
              list: languageList,
              onLanguageSubmit: () =>
                  Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginPage(),
              )),
              onLanguageChange: (data) {},
              languageSubmitLabel: 'Continue',
            ),
            const PoweredByDigit(),
          ],
        ),
      ),
    );
  }
}
