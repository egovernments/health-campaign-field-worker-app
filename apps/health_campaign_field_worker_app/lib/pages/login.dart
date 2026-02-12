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
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import '../data/remote_client.dart';
import '../data/repositories/remote/mdms.dart';
import '../router/app_router.dart';
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
  
  Map<String, dynamic>? _ssoConfig;
  bool _isLoadingSSO = true;

  @override
  void initState() {
    super.initState();
    _fetchSSOConfiguration();
  }

  Future<void> _fetchSSOConfiguration() async {
    try {
      final mdmsRepository = MdmsRepository(DioClient().dio);
      final tenantId = envConfig.variables.tenantId;
      
      final ssoConfig = await mdmsRepository.fetchSSOConfiguration(
        tenantId: tenantId,
      );

      if (mounted) {
        setState(() {
          _ssoConfig = ssoConfig;
          _isLoadingSSO = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _ssoConfig = null;
          _isLoadingSSO = false;
        });
      }
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
                          color: theme
                              .colorTheme.primary.primary2, // Use theme color
                        ),
                      ),
                      // Show username/password login if SSO is not enabled
                      
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
                        BlocBuilder<AppInitializationBloc,
                                AppInitializationState>(
                            builder: (context, initState) {
                          final privacyPolicyJson = initState.maybeWhen(
                              initialized:
                                  (AppConfiguration appConfiguration, _, __) =>
                                      appConfiguration.privacyPolicyConfig,
                              orElse: () => null);
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
                        }),
                        DigitButton(
                          label: localizations.translate(i18.login.actionLabel),
                          type: DigitButtonType.primary,
                          onPressed: () {
                            form.markAllAsTouched();
                            if (!form.valid) return;

                            FocusManager.instance.primaryFocus?.unfocus();

                            context.read<AuthBloc>().add(
                                  AuthLoginEvent(
                                    userId:
                                        (form.control(_userId).value as String)
                                            .trim(),
                                    password:
                                        (form.control(_password).value as String)
                                            .trim(),
                                    tenantId: envConfig.variables.tenantId,
                                  ),
                                );
                          },
                          size: DigitButtonSize.large,
                          mainAxisSize: MainAxisSize.max,
                        ),
                      
                      // Microsoft SSO Login Button - Show dynamically based on MDMS config
                      if (!_isLoadingSSO && _ssoConfig != null && _ssoConfig!['active'] == true)
                        _buildSSOButton(),
                      
                      // Forgot Password button - always visible in both SSO and username/password modes
                      DigitButton(
                        label: localizations.translate(
                          i18.forgotPassword.actionLabel,
                        ),
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
                                  size: DigitButtonSize.large)
                            ],
                          ),
                        ),
                      ),
                    ]);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSSOButton() {
    final logoUrl = _ssoConfig?['logo'] as String?;
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Container(
      margin: const EdgeInsets.only(top: spacer2),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          FocusManager.instance.primaryFocus?.unfocus();

          context.read<AuthBloc>().add(
                AuthMicrosoftSSOLoginEvent(
                  tenantId: envConfig.variables.tenantId,
                ),
              );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.colorTheme.primary.primary1,
          foregroundColor: theme.colorTheme.paper.primary,
          padding: const EdgeInsets.symmetric(
            horizontal: spacer4,
            vertical: spacer3,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacer1),
          ),
          minimumSize: const Size(double.infinity, 48),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (logoUrl != null)
              Image.network(
                logoUrl,
                width: 20,
                height: 20,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.login,
                    size: 20,
                    color: theme.colorTheme.paper.primary,
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
              ),
            if (logoUrl != null) const SizedBox(width: spacer2),
            Text(
              localizations.translate(
                i18.login.microsoftSSOLabel ?? 'LOGIN_MICROSOFT_SSO_LABEL',
              ),
              style: textTheme.bodyL.copyWith(
                color: theme.colorTheme.paper.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        _userId: FormControl<String>(
          value: '',
          validators: [Validators.required],
        ),
        _password: FormControl<String>(
          validators: [Validators.required],
          value: '',
        ),
        _privacyCheck: FormControl<bool>(
          value: false,
        )
      });
}

// convert to privacy notice model
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
