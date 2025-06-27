import 'package:attendance_management/attendance_management.dart';
import 'package:attendance_management/models/entities/scanned_individual_data.dart';
import 'package:digit_data_model/models/entities/individual.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/utils/date_utils.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/i18_key_constants.dart' as i18;
import '../../router/app_router.dart';
import '../../utils/utils.dart';
import '../../widgets/header/back_navigation_help_header.dart';
import '../../widgets/localized.dart';
import '../../widgets/non_mobile_user/non_mobile_user_card.dart';
import '../../widgets/non_mobile_user/show_qr_code_non_mobile_user.dart';

@RoutePage()
class NonMobileUserListPage extends LocalizedStatefulWidget {
  const NonMobileUserListPage({super.key});

  @override
  State<NonMobileUserListPage> createState() => _NonMobileUserListPageState();
}

class _NonMobileUserListPageState
    extends LocalizedState<NonMobileUserListPage> {
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
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return Scaffold(
      body: BlocProvider<AttendanceBloc>(
        create: (context) =>
            attendanceBloc!..add(const AttendanceEvents.fetchNonMobileUsers()),
        child: BlocBuilder<AttendanceBloc, AttendanceStates>(
          builder: (context, state) {
            return ScrollableContent(
              enableFixedDigitButton: true,
              header: BackNavigationHelpHeaderWidget(
                showHelp: false,
                handleback: () {
                  context.router.replaceAll([HomeRoute()]);
                },
                defaultPopRoute: false,
              ),
              footer: DigitCard(
                  margin: const EdgeInsets.only(top: spacer2),
                  children: [
                    DigitButton(
                      mainAxisSize: MainAxisSize.max,
                      label: localizations.translate(
                        i18.common.coreCommonGoback,
                      ),
                      type: DigitButtonType.primary,
                      size: DigitButtonSize.large,
                      onPressed: () {
                        context.router.replace(HomeRoute());
                      },
                    ),
                  ]),
              children: [
                BlocBuilder<AttendanceBloc, AttendanceStates>(
                    builder: (context, attendanceState) {
                  return attendanceState.maybeWhen(
                      orElse: () => const SizedBox.shrink(),
                      registerLoaded: (registers, offset, limit) {
                        return registers.isNotEmpty
                            ? Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(spacer2),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        '${localizations.translate(i18.nonMobileUser.nonMobileUserLabel)} (${registers.first.attendees!.length.toString()})',
                                        style: textTheme.headingXl.copyWith(
                                            color: theme.colorScheme.primary),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  ...List.generate(
                                      registers.first.attendees!.length, (x) {
                                    return NonMobileUserCard(
                                      mobileNumber: registers.first.individualList![x].mobileNumber.toString(),
                                      userName: registers.first
                                          .individualList![x].name!.givenName!,
                                      age: getAge(registers.first
                                          .individualList![x].dateOfBirth),
                                      onScanMe: () {
                                        showQRForNonMobileUser(
                                            context: context,
                                            individualScannerData:
                                                ScannedIndividualDataModel(
                                                    individualId: registers
                                                        .first
                                                        .individualList![x]
                                                        .individualId!,
                                                    age: getAge(registers
                                                        .first
                                                        .individualList![x]
                                                        .dateOfBirth),
                                                    locality: registers
                                                        .first
                                                        .individualList![x]
                                                        .boundaryCode,
                                                    name: registers
                                                        .first
                                                        .individualList![x]
                                                        .name!
                                                        .givenName!,
                                                    qrCreatedTime: DateTime
                                                            .now()
                                                        .millisecondsSinceEpoch),
                                            localizations: localizations,
                                            textTheme: textTheme);
                                      },
                                      gender: localizations.translate(registers
                                          .first.individualList![x].gender!.name
                                          .toUpperCase()),
                                      individualId: registers.first
                                          .individualList![x].individualId!,
                                    );
                                  })
                                ],
                              )
                            : Text(i18.common.noResultsFound);
                      });
                })
              ],
            );
          },
        ),
      ),
    );
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
