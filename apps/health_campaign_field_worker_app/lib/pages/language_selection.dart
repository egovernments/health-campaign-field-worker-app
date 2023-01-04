import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/material.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/app_config/app_config.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;


class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Container(
        color: theme.colorScheme.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<ApplicationConfigBloc, ApplicationConfigState>(
              builder: (context, state) {
                final languages =
                    state.appConfigDetail?.configuration?.appConfig.languages;

                if (languages == null) {
                  return const Offstage();
                }

                return DigitLanguageCard(
                  digitRowCardItems: languages
                      .map((e) => DigitRowCardModel.fromJson(e.toJson()))
                      .toList(),
                  onLanguageSubmit: () =>
                      context.router.push(const LoginRoute()),
                  languageSubmitLabel: i18.common.coreCommonContinue,
                );
              },
            ),
            const PoweredByDigit(),
          ],
        ),
      ),
    );
  }
}
