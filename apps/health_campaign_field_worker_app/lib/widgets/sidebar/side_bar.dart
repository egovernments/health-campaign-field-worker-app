import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../blocs/localization/app_localization.dart';
import '../../blocs/app_initialization/app_initialization.dart';
import '../../blocs/auth/auth.dart';
import '../../blocs/localization/localization.dart';
import '../../models/data_model.dart';
import '../../models/entities/roles_type.dart';
import '../../router/app_router.dart';
import '../../utils/i18_key_constants.dart' as i18;
import '../../utils/utils.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.read<AuthBloc>();
    final theme = Theme.of(context);
    bool isDistributor = authBloc.state != const AuthState.unauthenticated()
        ? context.loggedInUserRoles
            .where(
              (role) => role.code == RolesType.distributor.toValue(),
            )
            .toList()
            .isNotEmpty
        : false;

    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return Column(
        children: [
          Container(
            color: theme.colorScheme.secondary.withOpacity(0.12),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 280,
              child: state.maybeMap(
                authenticated: (value) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      value.userModel.name.toString(),
                      style: theme.textTheme.displayMedium,
                    ),
                    Text(
                      value.userModel.mobileNumber.toString(),
                      style: theme.textTheme.labelSmall,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).pop();
                        context.router.push(UserQRDetailsRoute());
                      },
                      child: Container(
                        height: 155,
                        width: 155,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: DigitTheme.instance.colorScheme.secondary,
                          ),
                        ),
                        child: QrImageView(
                          data: context.loggedInUserUuid,
                          version: QrVersions.auto,
                          size: 150.0,
                        ),
                      ),
                    ),
                  ],
                ),
                orElse: () => const Offstage(),
              ),
            ),
          ),
          DigitIconTile(
            title: AppLocalizations.of(context).translate(
              i18.common.coreCommonHome,
            ),
            icon: Icons.home,
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              context.router.replaceAll([HomeRoute()]);
            },
          ),
          BlocBuilder<AppInitializationBloc, AppInitializationState>(
            builder: (context, state) {
              if (state is! AppInitialized) return const Offstage();

              final appConfig = state.appConfiguration;
              final languages = state.appConfiguration.languages;
              final localizationModulesList =
                  state.appConfiguration.backendInterface;

              return DigitIconTile(
                title: AppLocalizations.of(context).translate(
                  i18.common.coreCommonlanguage,
                ),
                icon: Icons.language,
                onPressed: () {
                  // TODO: Complete implementation
                },
                content: Offstage(
                  offstage: languages == null,
                  child: BlocBuilder<LocalizationBloc, LocalizationState>(
                    builder: (context, localizationState) {
                      return localizationModulesList != null
                          ? Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: DigitRowCard(
                                onChanged: (value) {
                                  int index = languages.indexWhere(
                                    (ele) =>
                                        ele.value.toString() ==
                                        value.value.toString(),
                                  );
                                  context
                                      .read<LocalizationBloc>()
                                      .add(LocalizationEvent.onLoadLocalization(
                                        module: localizationModulesList
                                            .interfaces
                                            .where((element) =>
                                                element.type ==
                                                Modules.localizationModule)
                                            .map((e) => e.name.toString())
                                            .join(',')
                                            .toString(),
                                        tenantId:
                                            appConfig.tenantId ?? "default",
                                        locale: value.value.toString(),
                                        path: Constants.localizationApiPath,
                                      ));

                                  context.read<LocalizationBloc>().add(
                                        OnUpdateLocalizationIndexEvent(
                                          index: index,
                                          code: value.value.toString(),
                                        ),
                                      );
                                },
                                rowItems: languages!.map((e) {
                                  var index = languages.indexOf(e);

                                  return DigitRowCardModel(
                                    label: e.label,
                                    value: e.value,
                                    isSelected: getSelectedLanguage(
                                      state,
                                      index,
                                    ),
                                  );
                                }).toList(),
                                width: (MediaQuery.of(context).size.width *
                                        0.56 /
                                        languages.length) -
                                    (4 * languages.length),
                              ),
                            )
                          : const Offstage();
                    },
                  ),
                ),
              );
            },
          ),
          if (isDistributor)
            DigitIconTile(
              title: AppLocalizations.of(context).translate(
                i18.common.coreCommonViewDownloadedData,
              ),
              icon: Icons.download,
              onPressed: () {
                Navigator.of(context, rootNavigator: true).pop();
                context.router.push(const BeneficiariesReportRoute());
              },
            ),
          DigitIconTile(
            title: AppLocalizations.of(context)
                .translate(i18.common.coreCommonLogout),
            icon: Icons.logout,
            onPressed: () {
              context.read<BoundaryBloc>().add(const BoundaryResetEvent());
              context.read<AuthBloc>().add(const AuthLogoutEvent());
            },
          ),
          PoweredByDigit(
            version: Constants().version,
          ),
        ],
      );
    });
  }
}
