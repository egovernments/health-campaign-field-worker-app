import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/menu_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/app_router.dart';
import '../utils/extensions/extensions.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

@RoutePage<BoundaryModel>()
class CurrentBoundaryPage extends LocalizedStatefulWidget {
  final Function(BuildContext context)? onBoundarySelected;

  const CurrentBoundaryPage({
    super.key,
    super.appLocalizations,
    this.onBoundarySelected,
  });

  @override
  State<CurrentBoundaryPage> createState() => _CurrentBoundaryPageState();
}

class _CurrentBoundaryPageState extends LocalizedState<CurrentBoundaryPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<BoundaryBloc, BoundaryState>(
      builder: (context, state) {
        final boundaries = state.selectedLastLevelBoundaries;

        return Scaffold(
          backgroundColor: Colors.white,
          body: ScrollableContent(
            backgroundColor: Colors.white,
            header: const BackNavigationHelpHeaderWidget(
              showHelp: false,
            ),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      localizations.translate(
                        i18.common.selectCurrentBoundary,
                      ),
                      style: theme.digitTextTheme(context).headingXl.copyWith(
                        color: theme.colorTheme.primary.primary2
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: spacer4,
                  ),
                  child: ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: boundaries.length,
                    separatorBuilder: (_, __) =>
                        const SizedBox(height: spacer1),
                    itemBuilder: (context, index) {
                      final boundary = boundaries[index];

                      return InkWell(
                        onTap: () {
                          context.setBoundary(boundary);
                          if (widget.onBoundarySelected != null) {
                            widget.onBoundarySelected!(context);
                          } else {
                            context.router.pop(boundary);
                          }
                        },
                        child: DigitCard(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  localizations.translate(
                                    boundary.name ?? 'No Value',
                                  ),
                                  style: theme.digitTextTheme(context).headingM.copyWith(
                                    color: theme.colorTheme.text.primary
                                  ),
                                ),
                                Container(

                                  decoration: BoxDecoration(
                                    color: theme.colorTheme.primary.primary1,
                                    borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Icon(Icons.arrow_forward, color: theme.colorTheme.paper.primary,),
                                )
                              ],
                            )
                          ]
                        ),
                      );
                    },
                  ),
                ),
              ),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(spacer4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        localizations.translate(
                          i18.common.wantToChooseAnotherBoundary,
                        ),
                        style: theme.digitTextTheme(context).headingS.copyWith(
                            color: theme.colorTheme.primary.primary2
                        ),
                      ),
                      const SizedBox(height: spacer2),
                      DigitButton(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        type: DigitButtonType.secondary,
                        size: DigitButtonSize.medium,
                        prefixIcon: Icons.file_copy_sharp,
                        label: localizations.translate(
                          i18.common.chooseAnotherBoundary,
                        ),
                        onPressed: () {
                          context.router.replaceAll([
                            BoundarySelectionRoute(),
                          ]);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
