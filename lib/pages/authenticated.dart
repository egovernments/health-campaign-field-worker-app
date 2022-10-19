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
    AppBar appBar = AppBar();
    final theme = Theme.of(context);
    return Scaffold(
      appBar: appBar,
      drawer: Container(
          margin: const EdgeInsets.only(top: kToolbarHeight * 2),
          child: Drawer(
            child: ScrollableContent(
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
                      )
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
                  icon: Icons.menu_book,
                  content: DigitRowCard(
                    onPressed: (data) {},
                    list: languageList,
                    width: 100,
                  ),
                  onPressed: () {},
                ),
                DigitIconTile(
                  title: 'Logout',
                  icon: Icons.logout,
                  onPressed: () {},
                ),
              ],
            ),
          )),
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
