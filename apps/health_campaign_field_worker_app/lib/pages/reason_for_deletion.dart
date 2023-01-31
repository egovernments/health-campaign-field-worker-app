import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/app_initialization/app_initialization.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

class ReasonForDeletionPage extends LocalizedStatefulWidget {
  const ReasonForDeletionPage({
    super.key,
    super.appLocalizations,
  });

  @override
  State<ReasonForDeletionPage> createState() => _ReasonForDeletionPageState();
}

class _ReasonForDeletionPageState
    extends LocalizedState<ReasonForDeletionPage> {
  Object _groupValue = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: ScrollableContent(
        header: Column(children: const [
          BackNavigationHelpHeaderWidget(),
        ]),
        children: [
          DigitCard(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    localizations.translate(
                      i18.reasonForDeletion.reasonForDeletionLabel,
                    ),
                    style: theme.textTheme.displayMedium,
                  ),
                ),
                BlocBuilder<AppInitializationBloc, AppInitializationState>(
                  builder: (context, state) {
                    if (state is! AppInitialized) return const Offstage();

                    final householdDeletionReasonOptions =
                        state.appConfiguration.householdDeletionReasonOptions ??
                            <HouseholdDeletionReasonOptions>[];

                    return Column(
                      children: householdDeletionReasonOptions.map((element) {
                        return DigitRadioListTile(
                          groupValue: _groupValue,
                          onchange: () {
                            setState(() {
                              _groupValue = element.code;
                            });
                          },
                          title: Text(
                            localizations.translate(element.name),
                            style: theme.textTheme.bodyLarge,
                          ),
                          value: element.code,
                        );
                      }).toList(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
