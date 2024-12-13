import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/models/privacy_notice/privacy_notice_model.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget buildPasswordVisibility() {
      return IconButton(
        icon: Icon(
          passwordVisible ? Icons.visibility_off : Icons.visibility,
        ),
        onPressed: () {
          setState(() {
            passwordVisible = !passwordVisible;
          });
        },
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            orElse: () {},
            loading: () {
              DigitLoaders.inlineLoader();
            },
            error: (message) {
              Navigator.of(context, rootNavigator: true).pop();
              Toast.showToast(
                context,
                type: ToastType.error,
                message: message ?? localizations.translate('UNABLE_TO_LOGIN'),
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
                  children: [
                    Text(
                      localizations.translate(
                        i18.login.labelText,
                      ),
                      style: theme.textTheme.displayMedium,
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
                        showErrors: (control) =>
                            control.invalid && control.touched,
                        builder: (field) {
                          return LabeledField(
                            label: localizations.translate(
                              i18.login.userIdPlaceholder,
                            ),
                            isRequired: true,
                            child: DigitTextFormInput(
                              errorMessage: field.errorText,
                              initialValue: field.control.value,
                              onChange: (value) {
                                field.control.markAsTouched();
                                field.control.value = value;
                              },
                            ),
                          );
                        }),
                    ReactiveWrapperField(
                        formControlName: _password,
                        validationMessages: {
                          "required": (control) {
                            return localizations.translate(
                              '${i18.login.passwordPlaceholder}_IS_REQUIRED',
                            );
                          },
                        },
                        showErrors: (control) =>
                            control.invalid && control.touched,
                        builder: (field) {
                          return LabeledField(
                            label: localizations.translate(
                              i18.login.passwordPlaceholder,
                            ),
                            isRequired: true,
                            child: DigitPasswordFormInput(
                              errorMessage: field.errorText,
                              initialValue: field.control.value,
                              onChange: (value) {
                                field.control.markAsTouched();
                                field.control.value = value;
                              },
                            ),
                          );
                        }),
                    BlocBuilder<AppInitializationBloc, AppInitializationState>(
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
                        linkText: localizations
                            .translate(i18.privacyPolicy.privacyPolicyLinkText),
                        validationMessage: localizations.translate(
                            i18.privacyPolicy.privacyPolicyValidationText),
                      );
                    }),
                    const SizedBox(height: 16),
                    DigitButton(
                        label: localizations.translate(i18.login.actionLabel),
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
                        type: DigitButtonType.primary,
                        size: DigitButtonSize.large),
                    const SizedBox(
                      height: 16,
                    ),
                    TextButton(
                      onPressed: () => {
                        showCustomPopup(
                          context: context,
                          builder: (popupContext) => Popup(
                            title: localizations.translate(
                              i18.forgotPassword.labelText,
                            ),
                            onOutsideTap: () {
                              Navigator.of(popupContext).pop();
                            },
                            description:
                                "This popup demonstrates a simple popup with a title and description.",
                            type: PopUpType.simple,
                            actions: [
                              DigitButton(
                                label: localizations.translate(
                                  i18.forgotPassword.primaryActionLabel,
                                ),
                                onPressed: () {
                                  Navigator.of(popupContext).pop();
                                  context.router.popUntilRoot();
                                },
                                type: DigitButtonType.primary,
                                size: DigitButtonSize.large,
                              ),
                            ],
                          ),
                        )
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        minimumSize: const Size(0, 0),
                      ),
                      child: Center(
                        child: Text(
                          localizations.translate(
                            i18.forgotPassword.actionLabel,
                          ),
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
          value: 'USR-260849',
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
