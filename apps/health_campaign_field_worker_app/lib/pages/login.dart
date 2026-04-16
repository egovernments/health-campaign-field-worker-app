import 'package:digit_data_model/data_model.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/privacy_notice/privacy_notice_model.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/atoms/digit_loader.dart';
import 'package:digit_ui_components/widgets/atoms/pop_up_card.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:digit_ui_components/widgets/molecules/show_pop_up.dart';
import 'package:digit_ui_components/widgets/privacy_notice/privacy_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../blocs/localization/app_localization.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/local_store/no_sql/schema/service_registry.dart';
import '../router/app_router.dart';
import '../utils/constants.dart';
import '../utils/environment_config.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';

@RoutePage()
class LoginPage extends LocalizedStatefulWidget {
  const LoginPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends LocalizedState<LoginPage> {
  var passwordVisible = false;
  bool isPrivacyEnabled = false;
  static const _userId = 'userId';
  static const _password = 'password';
  static const _privacyCheck = 'privacyCheck';

  String? _pendingUserId;
  String? _pendingPassword;

  @override
  void initState() {
    super.initState();
  }

  void _checkOtherDeviceLogin(BuildContext context, String username) async {
    final authBloc = context.read<AuthBloc>();

    try {
      final isar = await Constants().isar;
      final serviceRegistry = await isar.serviceRegistrys.where().findAll();

      if (serviceRegistry.isEmpty) {
        // Fall back to regular login if service registry is empty
        authBloc.add(const AuthEvent.allow());
        return;
      }

      final apiEndPoint = Constants.getMultiLoginEndPoint(
        serviceRegistry: serviceRegistry,
        service: Constants.multiLoginService,
        entityName: Constants.multiLoginEntity,
        action: ApiOperation.validate.toValue(),
      );

      authBloc.add(
        AuthEvent.checkOtherDeviceLogin(
          username: username,
          apiEndPoint: apiEndPoint,
          tenantId: envConfig.variables.tenantId,
        ),
      );
    } catch (e) {
      // Fall back to regular login on error
      authBloc.add(const AuthEvent.allow());
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      appBar: AppBar(
        foregroundColor: theme.colorTheme.paper.primary,
        backgroundColor: theme.colorTheme.primary.primary2,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loading: () {
              DigitLoaders.overlayLoader(context: context);
            },
            allow: () {
              Navigator.of(context, rootNavigator: true).pop();
              context.read<AuthBloc>().add(
                    AuthLoginEvent(
                      userId: _pendingUserId as String,
                      password: _pendingPassword as String,
                      tenantId: envConfig.variables.tenantId,
                    ),
                  );
            },
            otherDevice: () {
              Navigator.of(context, rootNavigator: true).pop();
              _showMultiDeviceLoginPopUp(
                context,
                username: _pendingUserId as String,
                password: _pendingPassword as String,
              );
            },
            error: (message) {
              Navigator.of(context, rootNavigator: true).pop();
              Toast.showToast(
                context,
                message: message ??
                    localizations.translate(i18.login.unableToLoginText),
                type: ToastType.error,
              );
            },
          );
        },
        child: ScrollableContent(
          children: [
            ReactiveFormBuilder(
              form: buildForm,
              builder: (context, form, child) {
                return DigitCard(
                  margin: const EdgeInsets.all(spacer2),
                  children: [
                    Text(
                      localizations.translate(
                        i18.login.labelText,
                      ),
                      style: textTheme.headingXl.copyWith(
                        color: theme.colorTheme.primary.primary2,
                      ),
                    ),
                    ReactiveWrapperField(
                      formControlName: _userId,
                      validationMessages: {
                        "required": (control) {
                          return localizations.translate(
                            '${i18.login.userIdPlaceholder}_IS_REQUIRED',
                          );
                        },
                      },
                      builder: (field) => LabeledField(
                        label: localizations.translate(
                          i18.login.userIdPlaceholder,
                        ),
                        capitalizedFirstLetter: false,
                        isRequired: true,
                        child: DigitTextFormInput(
                          keyboardType: TextInputType.text,
                          initialValue: form.control(_userId).value,
                          errorMessage: field.errorText,
                          onChange: (value) {
                            form.control(_userId).value = value;
                          },
                        ),
                      ),
                    ),
                    ReactiveWrapperField(
                      formControlName: _password,
                      validationMessages: {
                        "required": (control) {
                          return localizations.translate(
                            '${i18.login.passwordPlaceholder}_IS_REQUIRED',
                          );
                        },
                      },
                      builder: (field) => LabeledField(
                        label: localizations.translate(
                          i18.login.passwordPlaceholder,
                        ),
                        isRequired: true,
                        child: DigitPasswordFormInput(
                          initialValue: form.control(_password).value,
                          errorMessage: field.errorText,
                          onChange: (value) {
                            form.control(_password).value = value;
                          },
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    BlocBuilder<AppInitializationBloc, AppInitializationState>(
                      builder: (context, initState) {
                        final privacyPolicyJson = initState.maybeWhen(
                          initialized:
                              (AppConfiguration appConfiguration, _, __) =>
                                  appConfiguration.privacyPolicyConfig,
                          orElse: () => null,
                        );
                        if (privacyPolicyJson?.active == false) {
                          return const SizedBox.shrink();
                        }

                        form
                            .control(_privacyCheck)
                            .setValidators([Validators.requiredTrue]);
                        form.control(_privacyCheck).updateValueAndValidity();
                        return PrivacyComponent(
                          privacyPolicy:
                              convertToPrivacyPolicyModel(privacyPolicyJson),
                          formControlName: _privacyCheck,
                          text: localizations
                              .translate(i18.privacyPolicy.privacyNoticeText),
                          linkText: localizations.translate(
                              i18.privacyPolicy.privacyPolicyLinkText),
                          validationMessage: localizations.translate(
                              i18.privacyPolicy.privacyPolicyValidationText),
                        );
                      },
                    ),
                    BlocBuilder<AppInitializationBloc, AppInitializationState>(
                      builder: (context, state) {
                        return DigitButton(
                          label: localizations.translate(i18.login.actionLabel),
                          type: DigitButtonType.primary,
                          onPressed: () {
                            form.markAllAsTouched();
                            if (!form.valid) return;

                            FocusManager.instance.primaryFocus?.unfocus();

                            _pendingUserId =
                                (form.control(_userId).value as String).trim();
                            _pendingPassword =
                                (form.control(_password).value as String)
                                    .trim();

                            final bool singleUserLogin = state.maybeWhen(
                              initialized: (appConfiguration, _, __) {
                                final list =
                                    appConfiguration.singleUserLogin ?? [];
                                if (list.isEmpty) return false;
                                final config = list.first;
                                return config.enabled;
                              },
                              orElse: () => false,
                            );

                            if (singleUserLogin) {
                              _checkOtherDeviceLogin(
                                  context, _pendingUserId as String);
                            } else {
                              context.read<AuthBloc>().add(
                                    AuthLoginEvent(
                                      userId: _pendingUserId as String,
                                      password: _pendingPassword as String,
                                      tenantId: envConfig.variables.tenantId,
                                    ),
                                  );
                            }
                          },
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                        );
                      },
                    ),
                    DigitButton(
                      label: localizations.translate(
                        i18.forgotPassword.actionLabel,
                      ),
                      capitalizeLetters: false,
                      mainAxisSize: MainAxisSize.max,
                      type: DigitButtonType.tertiary,
                      size: DigitButtonSize.medium,
                      onPressed: () => showCustomPopup(
                        context: context,
                        builder: (ctx) => Popup(
                          title: localizations.translate(
                            i18.forgotPassword.labelText,
                          ),
                          description: localizations.translate(
                            i18.forgotPassword.contentText,
                          ),
                          onOutsideTap: () {
                            Navigator.of(ctx).pop();
                          },
                          type: PopUpType.simple,
                          actions: [
                            DigitButton(
                              label: localizations.translate(
                                i18.forgotPassword.primaryActionLabel,
                              ),
                              onPressed: () {
                                Navigator.of(ctx).pop();
                                context.router.popUntilRoot();
                              },
                              type: DigitButtonType.primary,
                              size: DigitButtonSize.large,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        _userId: FormControl<String>(
          value: 'Gap-bo-cdd-1',
          validators: [Validators.required],
        ),
        _password: FormControl<String>(
          validators: [Validators.required],
          value: 'eGov@123',
        ),
        _privacyCheck: FormControl<bool>(
          value: false,
        )
      });
}

// // convert to privacy notice model
PrivacyNoticeModel? convertToPrivacyPolicyModel(PrivacyPolicy? privacyPolicy) {
  return PrivacyNoticeModel(
    header: privacyPolicy?.header ?? '',
    module: privacyPolicy?.module ?? '',
    active: privacyPolicy?.active,
    contents: privacyPolicy?.contents
        ?.map((content) => ContentNoticeModel(
              header: content.header,
              descriptions: content.descriptions
                  ?.map((description) => DescriptionNoticeModel(
                        text: description.text,
                        type: description.type,
                        isBold: description.isBold,
                        subDescriptions: description.subDescriptions
                            ?.map((subDescription) => SubDescriptionNoticeModel(
                                  text: subDescription.text,
                                  type: subDescription.type,
                                  isBold: subDescription.isBold,
                                  isSpaceRequired:
                                      subDescription.isSpaceRequired,
                                ))
                            .toList(),
                      ))
                  .toList(),
            ))
        .toList(),
  );
}

void _showMultiDeviceLoginPopUp(
  BuildContext context, {
  required String username,
  required String password,
}) {
  showCustomPopup(
    context: context,
    builder: (ctx) => Popup(
      title: AppLocalizations.of(context)
          .translate(i18.login.switchMobileDialogTitle),
      titleIcon: Icon(Icons.error_outline, color: const Light().alertError),
      additionalWidgets: [
        Text(
          AppLocalizations.of(context)
              .translate(i18.login.switchMobileDialogContent),
          textAlign: TextAlign.center,
          style: Theme.of(ctx).textTheme.bodyMedium,
        ),
      ],
      actions: [
        DigitButton(
          label: AppLocalizations.of(context)
              .translate(i18.login.switchMobileDialogContine),
          onPressed: () {
            Navigator.of(ctx).pop(); // Close popup
            // Use the parent context to navigate
            context.router.replaceAll([
              DeviceChangeReasonRoute(
                username: username,
                password: password,
              ),
            ]);
          },
          type: DigitButtonType.primary,
          mainAxisSize: MainAxisSize.max,
          size: DigitButtonSize.large,
        ),
        DigitButton(
          label: AppLocalizations.of(context)
              .translate(i18.login.switchMobileDialogBack),
          prefixIcon: Icons.undo,
          onPressed: () {
            context.read<AuthBloc>().add(const AuthEvent.reset());
            Navigator.of(ctx).pop(); // Just close popup
          },
          type: DigitButtonType.secondary,
          mainAxisSize: MainAxisSize.max,
          size: DigitButtonSize.medium,
        ),
      ],
    ),
  );
}
