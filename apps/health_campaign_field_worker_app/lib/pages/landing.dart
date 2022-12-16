import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:digit_components/digit_components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/app_config/app_config.dart';
import '../router/app_router.dart';
=======
import 'dart:convert';
import 'package:digit_components/digit_components.dart';
import '../data/fake_language_schema.dart';
import 'login.dart';
>>>>>>> a946f4e (resolved conflicts)

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        color: theme.colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<ApplicationConfigBloc, ApplicationConfigState>(
              builder: (context, state) {
                return state.appConfigDetail?.configuration?.appConfig
                            .languages !=
                        null
                    ? DigitLanguageCard(
                        list: state
                            .appConfigDetail?.configuration?.appConfig.languages
                            .map((e) => DigitRowCardModel.fromJson(e.toJson()))
                            .toList() as List<DigitRowCardModel>,
                        onLanguageSubmit: () =>
                            AutoRouter.of(context).pushNamed('login'),
                        onLanguageChange: (data) {},
                        languageSubmitLabel: 'Continue',
                      )
                    : const SizedBox(
                        width: 0,
                        height: 0,
                      );
              },
            ),
            const PoweredByDigit(),
          ],
        ),
=======
    final List list = json.decode(fakeLanguageSchema);
    List<DigitRowCardModel> languageList =
        list.map((e) => DigitRowCardModel.fromJson(e)).toList();

    return Scaffold(
      body: ScrollableContent(
        children: [
          DigitBanner(
            color: DigitTheme.instance.colors.regalBlue,
            imgUrl:
                'https://s3.ap-south-1.amazonaws.com/pb-egov-assets/pb.testing/Punjab-bg-QA.jpg',
            child: Align(
              alignment: Alignment.bottomCenter,
              child: DigitLanguageCard(
                list: languageList,
                onPressedButton: () =>
                    Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LoginPage(),
                )),
                onPressedicon: (data) {},
                actionlabel: 'Continue',
              ),
            ),
          ),
        ],
>>>>>>> a946f4e (resolved conflicts)
      ),
    );
  }
}
