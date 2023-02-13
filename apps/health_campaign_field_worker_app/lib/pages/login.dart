import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../blocs/auth/auth.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget buildPasswordVisibility() {
      return IconButton(
        icon: Icon(
          passwordVisible ? Icons.visibility : Icons.visibility_off,
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
      body: ScrollableContent(
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
                          return '${localizations.translate(i18.login.userIdPlaceholder)} is Required';
                        },
                      },
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
                          return '${localizations.translate(i18.login.passwordPlaceholder)} is Required';
                        },
                      },
                      formControlName: _password,
                      keyboardType: TextInputType.text,
                      isRequired: true,
                      obscureText: !passwordVisible,
                      suffix: buildPasswordVisibility(),
                    ),
                    const SizedBox(height: 16),
                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) => DigitElevatedButton(
                        onPressed: state.loading
                            ? null
                            : () {
                                form.markAllAsTouched();
                                if (!form.valid) return;

                                context.read<AuthBloc>().add(
                                      AuthLoginEvent(
                                        userId: form.control(_userId).value
                                            as String,
                                        password: form.control(_password).value
                                            as String,
                                      ),
                                    );
                              },
                        child: Center(
                          child: Text(
                            localizations.translate(i18.login.actionLabel),
                          ),
                        ),
                      ),
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
                            action: (ctx) =>
                                Navigator.of(context, rootNavigator: true)
                                    .pop(),
                          ),
                        ),
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
    );
  }

  FormGroup buildForm() => fb.group(<String, Object>{
        _userId: FormControl<String>(validators: [Validators.required]),
        _password: FormControl<String>(validators: [Validators.required]),
      });
}
