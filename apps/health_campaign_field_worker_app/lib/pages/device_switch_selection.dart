import 'package:auto_route/auto_route.dart';
import 'package:digit_data_model/models/oplog/oplog_entry.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/RadioButtonModel.dart';
import 'package:digit_ui_components/theme/ComponentTheme/back_button_theme.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_back_button.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/localization/app_localization.dart';
import '../data/local_store/no_sql/schema/service_registry.dart';
import '../router/app_router.dart';
import '../utils/constants.dart';
import '../utils/environment_config.dart';
import '../widgets/localized.dart';
import '../utils/i18_key_constants.dart' as i18;

@RoutePage()
class DeviceChangeReasonPage extends LocalizedStatefulWidget {
  final String username;
  final String password;

  const DeviceChangeReasonPage({
    super.key,
    super.appLocalizations,
    required this.username,
    required this.password,
  }) : super();

  @override
  State<DeviceChangeReasonPage> createState() => _DeviceChangeReasonPageState();
}

class _DeviceChangeReasonPageState extends State<DeviceChangeReasonPage> {
  String? _selectedReason;
  final TextEditingController _otherReasonController = TextEditingController();

  bool _showOtherReasonError = false;
  bool _showReasonError = false;

  @override
  void dispose() {
    _otherReasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Builder(
      builder: (blocContext) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              loading: () {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
              error: (error) {
                Navigator.of(context, rootNavigator: true).pop();
                Toast.showToast(
                  context,
                  message: error ??
                      AppLocalizations.of(context)
                          .translate(i18.login.unableToLoginText),
                  type: ToastType.error,
                );

                context.router.replaceAll([LoginRoute()]);
              },
            );
          },
          child: BlocBuilder<AppInitializationBloc, AppInitializationState>(
            builder: (context, state) {
              return state.maybeWhen(
                initialized: (appConfiguration, _, __) {
                  final reasons = appConfiguration.deviceChangeReasons ?? [];

                  return Scaffold(
                    appBar: AppBar(
                      foregroundColor: theme.colorTheme.paper.primary,
                      backgroundColor: theme.colorTheme.primary.primary2,
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16),

                          /// Header
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: spacer5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DigitBackButton(
                                  label: AppLocalizations.of(context)
                                      .translate(i18.common.coreCommonBack),
                                  digitBackButtonThemeData:
                                      const DigitBackButtonThemeData().copyWith(
                                    context: context,
                                    backDigitButtonIcon: Icon(
                                      Icons.arrow_left,
                                      size: MediaQuery.of(context).size.width <
                                              500
                                          ? Theme.of(context)
                                              .spacerTheme
                                              .spacer5
                                          : Theme.of(context)
                                              .spacerTheme
                                              .spacer6,
                                      color: Theme.of(context)
                                          .colorTheme
                                          .primary
                                          .primary2,
                                    ),
                                  ),
                                  handleBack: () {
                                    context.router.replaceAll([LoginRoute()]);
                                  },
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 10),

                          /// Card
                          DigitCard(
                            padding: const EdgeInsets.all(spacer5),
                            margin: const EdgeInsets.all(spacer4),
                            children: [
                              Text(
                                AppLocalizations.of(context)
                                    .translate(i18.login.switchReasonHeader),
                                style: textTheme.headingXl.copyWith(
                                  color: theme.colorTheme.primary.primary2,
                                ),
                              ),

                              Text(
                                AppLocalizations.of(context)
                                    .translate(i18.login.switchReason),
                                style: textTheme.headingXl.copyWith(
                                  color: theme.colorTheme.primary.primary2,
                                  fontSize: 16,
                                ),
                              ),

                              /// Radio List
                              RadioList(
                                errorMessage: _showReasonError
                                    ? AppLocalizations.of(context).translate(
                                        i18.login.switchReasonRequiredError)
                                    : null,
                                radioDigitButtons: reasons
                                    .map(
                                      (reason) => RadioButtonModel(
                                        code: reason.code,
                                        name: AppLocalizations.of(context)
                                            .translate(reason.code),
                                      ),
                                    )
                                    .toList(),
                                groupValue: _selectedReason ?? '',
                                onChanged: (value) {
                                  setState(() {
                                    _selectedReason = value.code;
                                    _showReasonError = false;
                                  });
                                },
                              ),

                              /// Others textarea
                              if (_selectedReason ==
                                  Constants.deviceSelectionOtherReason)
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: spacer4,
                                  ),
                                  child: DigitTextAreaFormInput(
                                    controller: _otherReasonController,
                                    isRequired: true,
                                    errorMessage: _showOtherReasonError
                                        ? AppLocalizations.of(context)
                                            .translate(
                                                i18.common.corecommonRequired)
                                        : null,
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    /// Bottom Button
                    bottomNavigationBar: Container(
                      margin: const EdgeInsets.symmetric(
                        vertical: spacer4,
                        horizontal: spacer4,
                      ),
                      child: DigitButton(
                        label: AppLocalizations.of(context)
                            .translate(i18.login.switchReasonContinue),
                        onPressed: () => _userDeviceSwitch(
                          blocContext: blocContext,
                          selectedReason: _selectedReason,
                          otherReason: _otherReasonController.text,
                        ),
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large,
                      ),
                    ),
                  );
                },
                orElse: () => const Center(child: CircularProgressIndicator()),
              );
            },
          ),
        );
      },
    );
  }

  void _userDeviceSwitch({
    required BuildContext blocContext,
    required String? selectedReason,
    String? otherReason,
  }) async {
    if (selectedReason == Constants.deviceSelectionOtherReason &&
        (otherReason == null || otherReason.trim().isEmpty)) {
      setState(() {
        _showOtherReasonError = true;
      });
      return;
    }

    if (selectedReason == null) {
      setState(() {
        _showReasonError = true;
      });
      return;
    }

    setState(() {
      _showOtherReasonError = false;
      _showReasonError = false;
    });

    final finalReason = selectedReason;
    final isar = await Constants().isar;
    final serviceRegistry = await isar.serviceRegistrys.where().findAll();

    final apiEndPoint = Constants.getMultiLoginEndPoint(
      serviceRegistry: serviceRegistry,
      service: Constants.multiLoginService,
      action: Constants.multiLoginSwitchOperation,
      entityName: Constants.multiLoginEntity,
    );

    blocContext.read<AuthBloc>().add(
          AuthEvent.switchDevice(
            apiEndPoint: apiEndPoint,
            selectedReason: finalReason,
            deviceSwitchComment: otherReason,
            username: widget.username,
            password: widget.password,
            tenantId: envConfig.variables.tenantId,
          ),
        );
  }
}
