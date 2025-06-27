import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/models/entities/scanned_individual_data.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_data_model/utils/utils.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/ComponentTheme/digit_tab_bar_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/atoms/digit_tab.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../blocs/auth/auth.dart';
import '../models/data_model.dart';
import '../router/app_router.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../utils/utils.dart';
import '../widgets/header/back_navigation_help_header.dart';
import '../widgets/localized.dart';

@RoutePage()
class UserQRDetailsPage extends LocalizedStatefulWidget {
  const UserQRDetailsPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<UserQRDetailsPage> createState() => _UserQRDetailsPageState();
}

class _UserQRDetailsPageState extends LocalizedState<UserQRDetailsPage> {
  int selectedIndex = 0;
  AttendanceBloc? attendanceBloc;

  @override
  void initState() {
    attendanceBloc = AttendanceBloc(
      const RegisterLoading(),
      attendanceDataRepository: context
          .repository<AttendanceRegisterModel, AttendanceRegisterSearchModel>(),
      attendanceLogDataRepository:
          context.repository<AttendanceLogModel, AttendanceLogSearchModel>(),
      individualDataRepository:
          context.repository<IndividualModel, IndividualSearchModel>(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        context.router.replaceAll([HomeRoute()]);
      },
      child: Scaffold(
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            bool isDistributor = state.maybeMap(
              authenticated: (value) => value.userModel.roles
                  .any((role) => role.code == RolesType.distributor.toValue()),
              orElse: () => false,
            );

            final List<String> tabs = isDistributor
                ? [
                    localizations.translate(i18.common.qrInventory),
                    localizations.translate(i18.common.qrAttendance),
                  ]
                : [];

            if (selectedIndex >= tabs.length && tabs.isNotEmpty) {
              selectedIndex = 0;
            }

            return ScrollableContent(
              enableFixedDigitButton: true,
              header: Column(children: [
                BackNavigationHelpHeaderWidget(
                  showHelp: false,
                  handleback: () {
                    context.router.replaceAll([HomeRoute()]);
                  },
                  defaultPopRoute: false,
                ),
              ]),
              footer: DigitCard(
                margin: const EdgeInsets.only(top: spacer2),
                children: [
                  DigitButton(
                    label: localizations.translate(i18.common.corecommonclose),
                    size: DigitButtonSize.large,
                    type: DigitButtonType.primary,
                    mainAxisSize: MainAxisSize.max,
                    onPressed: () {
                      context.router.replaceAll([HomeRoute()]);
                    },
                  ),
                ],
              ),
              children: [
                if (isDistributor)
                  Padding(
                    padding: const EdgeInsets.all(spacer2),
                    child: DigitTabBar(
                      tabBarThemeData: DigitTabBarThemeData(
                          tabWidth: MediaQuery.of(context).size.width*.45,
                      ),
                      initialIndex: selectedIndex,
                      tabs: tabs,
                      onTabSelected: (index) {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  ),
                const SizedBox(height: spacer10,),
                IndexedStack(
                  index: selectedIndex,
                  children: [
                    _buildInventoryQR(context, state),
                    BlocProvider<AttendanceBloc>(
                      create: (_) => attendanceBloc!
                        ..add(const AttendanceEvents.fetchNonMobileUsers(
                            fetchOnlyMobileUser: true)),
                      child: _buildAttendanceQR(context),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildInventoryQR(BuildContext context, AuthState state) {
    final theme = Theme.of(context);

    return state.maybeMap(
      authenticated: (value) => Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.25,
            height: MediaQuery.of(context).size.width / 1.25,
            child: Padding(
              padding: const EdgeInsets.all(spacer2),
              child: Container(
                padding: const EdgeInsets.all(spacer2),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(spacer1)),
                    border: Border.all(
                      color: theme.colorTheme.primary.primary1,
                      width: 2,
                    )),
                child: QrImageView(
                  data: context.loggedInUserUuid,
                  version: QrVersions.auto,
                  size: MediaQuery.of(context).size.width / 1.25,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              value.userModel.name.toString(),
              style: DigitTheme.instance.mobileTheme.textTheme.headlineMedium
                  ?.apply(
                color: DigitTheme.instance.colorScheme.shadow,
              ),
            ),
          ),
        ],
      ),
      orElse: () => const Offstage(),
    );
  }

  Widget _buildAttendanceQR(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return BlocBuilder<AttendanceBloc, AttendanceStates>(
        builder: (context, attendanceState) {
      return attendanceState.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          registerLoaded: (registers, offset, limit) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.25,
                  height: MediaQuery.of(context).size.width / 1.25,
                  child: Padding(
                    padding: const EdgeInsets.all(spacer2),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(spacer1)),
                          border: Border.all(
                            color: theme.colorTheme.primary.primary1,
                            width: 2,
                          )),
                      child: QrImageView(
                        data: DataMapEncryptor().encryptWithRandomKey(
                            ScannedIndividualDataModel(
                                    name: registers.first.individualList!.first
                                        .name!.givenName!,
                                    individualId: registers.first
                                        .individualList!.first.individualId,
                                    age: getAge(registers.first.individualList!
                                        .first.dateOfBirth),
                                    locality: registers.first.individualList!
                                        .first.boundaryCode,
                                    qrCreatedTime:
                                        DateTime.now().millisecondsSinceEpoch)
                                .toMap()),
                        version: QrVersions.auto,
                        size: MediaQuery.of(context).size.width / 1.25,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: spacer4),
                Center(
                  child: Text(
                    registers.first.individualList!.first.name!.givenName!,
                    style: DigitTheme
                        .instance.mobileTheme.textTheme.headlineMedium
                        ?.apply(
                      color: DigitTheme.instance.colorScheme.shadow,
                    ),
                  ),
                ),
                const SizedBox(height: spacer2,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.32,
                    padding: const EdgeInsets.symmetric(
                        horizontal: spacer1, vertical: spacer1),
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(spacer1)),
                      border: Border(
                          left: BorderSide(
                              color: theme.colorTheme.generic.divider),
                          right: BorderSide(
                              color: theme.colorTheme.generic.divider),
                          bottom: BorderSide(
                              color: theme.colorTheme.generic.divider),
                          top: BorderSide(
                              color: theme.colorTheme.generic.divider)),
                      color: theme.colorTheme.paper.secondary,
                    ),
                    child: Center(
                      child: Text(
                          registers.first.individualList!.first.individualId!,
                          style: textTheme.headingXS.copyWith(
                              color: theme.colorTheme.primary.primary2)),
                    ),
                  ),
                )
              ],
            );
          });
    });
  }

  getAge(String? dateOfBirth) {
    final ageInYears = dateOfBirth != null
        ? DigitDateUtils.calculateAge(
            DigitDateUtils.getFormattedDateToDateTime(
                  dateOfBirth,
                ) ??
                DateTime.now(),
          ).years
        : 0;
    final ageInMonths = dateOfBirth != null
        ? DigitDateUtils.calculateAge(
            DigitDateUtils.getFormattedDateToDateTime(
                  dateOfBirth,
                ) ??
                DateTime.now(),
          ).months
        : 0;

    return '$ageInYears ${localizations.translate('YEARS')} $ageInMonths ${localizations.translate('MONTHS')}';
  }
}
