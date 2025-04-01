import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/privacy_notice/privacy_notice_model.dart';
import 'package:digit_components/widgets/atoms/digit_toaster.dart';
import 'package:digit_components/widgets/privacy_notice/privacy_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/local_store/no_sql/schema/app_configuration.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/app_initialization/app_initialization.dart';
import '../blocs/auth/auth.dart';
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
  static const _userId = 'userId';
  static const _password = 'password';
  static const _privacyCheck = 'privacyCheck';

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
              Loaders.showLoadingDialog(context);
            },
            error: (message) {
              Navigator.of(context, rootNavigator: true).pop();
              DigitToast.show(
                context,
                options: DigitToastOptions(
                  message ?? localizations.translate('UNABLE_TO_LOGIN'),
                  true,
                  theme,
                ),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        localizations.translate(
                          i18.login.labelText,
                        ),
                        style: theme.textTheme.displayMedium,
                      ),
                      DigitTextFormField(
                        label: localizations.translate(
                          i18.login.userIdPlaceholder,
                        ),
                        validationMessages: {
                          "required": (control) {
                            return localizations.translate(
                              '${i18.login.userIdPlaceholder}_IS_REQUIRED',
                            );
                          },
                        },
                        textCapitalization: TextCapitalization.none,
                        formControlName: _userId,
                        isRequired: true,
                        keyboardType: TextInputType.text,
                      ),
                      DigitTextFormField(
                        label: localizations.translate(
                          i18.login.passwordPlaceholder,
                        ),
                        validationMessages: {
                          "required": (control) {
                            return localizations.translate(
                              '${i18.login.passwordPlaceholder}_IS_REQUIRED',
                            );
                          },
                        },
                        formControlName: _password,
                        keyboardType: TextInputType.text,
                        isRequired: true,
                        textCapitalization: TextCapitalization.none,
                        obscureText: !passwordVisible,
                        suffix: buildPasswordVisibility(),
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<AppInitializationBloc,
                              AppInitializationState>(
                          builder: (context, initState) {
                        final privacyPolicyJson = initState.maybeWhen(
                            initialized: (
                              AppConfiguration appConfiguration,
                              _,
                            ) =>
                                appConfiguration.privacyPolicyConfig,
                            orElse: () => null);
                        if (privacyPolicyJson?.active == false) {
                          return const SizedBox.shrink();
                        }

                        form
                            .control(_privacyCheck)
                            .setValidators([Validators.requiredTrue]);
                        form.control(_privacyCheck).updateValueAndValidity();
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                kPadding / 4,
                                0,
                                0,
                                0,
                              ),
                              child: PrivacyComponent(
                                privacyPolicy: convertToPrivacyPolicyModel(
                                    privacyPolicyJson),
                                formControlName: _privacyCheck,
                                text: localizations.translate(
                                    i18.privacyPolicy.privacyNoticeText),
                                linkText: localizations.translate(
                                    i18.privacyPolicy.privacyPolicyLinkText),
                                validationMessage: localizations.translate(i18
                                    .privacyPolicy.privacyPolicyValidationText),
                              ),
                            ),
                            const SizedBox(
                              height: kPadding * 2,
                            ),
                          ],
                        );
                      }),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          return DigitElevatedButton(
                            onPressed: state.maybeWhen(
                              orElse: () => () {
                                form.markAllAsTouched();
                                if (!form.valid) return;

                                FocusManager.instance.primaryFocus?.unfocus();

                                context.read<AuthBloc>().add(
                                      AuthLoginEvent(
                                        userId: (form.control(_userId).value
                                                as String)
                                            .trim(),
                                        password: (form.control(_password).value
                                                as String)
                                            .trim(),
                                        tenantId: envConfig.variables.tenantId,
                                      ),
                                    );
                              },
                              loading: () => null,
                            ),
                            child: Center(
                              child: Text(
                                localizations.translate(i18.login.actionLabel),
                              ),
                            ),
                          );
                        },
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextButton(
                        onPressed: () => DigitDialog.show(
                          context,
                          options: DigitDialogOptions(
                            titleText: localizations.translate(
                              i18.forgotPassword.labelText,
                            ),
                            contentText: localizations.translate(
                              i18.forgotPassword.contentText,
                            ),
                            primaryAction: DigitDialogActions(
                                label: localizations.translate(
                                  i18.forgotPassword.primaryActionLabel,
                                ),
                                action: (ctx) {
                                  Navigator.of(ctx).pop();
                                  context.router.popUntilRoot();
                                }),
                          ),
                        ),
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
                  ),
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
          value: '',
          validators: [Validators.required],
        ),
        _password: FormControl<String>(
          validators: [Validators.required],
          value: '',
        ),
        _privacyCheck: FormControl<bool>(
          value: false,
        ),
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
