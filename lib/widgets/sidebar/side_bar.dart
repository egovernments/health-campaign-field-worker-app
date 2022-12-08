import 'dart:convert';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:health_campaigns_flutter/data/fake_language_schema.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});
  @override
  Widget build(BuildContext context) {
    final List list = json.decode(fakeLanguageSchema);
    List<DigitRowCardModel> languageList =
        list.map((e) => DigitRowCardModel.fromJson(e)).toList();
    final theme = Theme.of(context);

    return ScrollableContent(
      footer: const PoweredByDigit(),
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Carlos',
                style: theme.textTheme.displayMedium,
              ),
              Text(
                '+258 6387387',
                style: theme.textTheme.labelSmall,
              ),
            ],
          ),
        ),
        DigitIconTile(
          title: 'Home',
          icon: Icons.home,
          onPressed: () {},
        ),
        DigitIconTile(
          title: 'Language',
          icon: Icons.language,
          content: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: DigitRowCard(
              onPressed: (data) {},
              list: languageList,
              width: (MediaQuery.of(context).size.width *
                      0.5 /
                      languageList.length) -
                  (4 * languageList.length),
            ),
          ),
          onPressed: () {},
        ),
        DigitIconTile(
          title: 'Logout',
          icon: Icons.logout,
          onPressed: () {},
        ),
      ],
    );
  }
}
