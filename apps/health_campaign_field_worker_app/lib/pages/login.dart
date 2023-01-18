import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: ScrollableContent(
        children: [
          DigitCard(
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
                DigitTextField(
                  label: localizations.translate(
                    i18.login.userIdPlaceholder,
                  ),
                ),
                DigitTextField(
                  label: localizations.translate(
                    i18.login.passwordPlaceholder,
                  ),
                ),
                const SizedBox(height: 16),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) => DigitElevatedButton(
                    onPressed: state.loading
                        ? null
                        : () {
                            context.read<AuthBloc>().add(
                                  const AuthLoginEvent(
                                    userId: '',
                                    password: '',
                                  ),
                                );
                          },
                    child: Center(
                      child:
                          Text(localizations.translate(i18.login.actionLabel)),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => DigitDialog.show(
                    context,
                    title: i18.forgotPassword.labelText,
                    content: i18.forgotPassword.contentText,
                    primaryActionLabel: i18.forgotPassword.primaryActionLabel,
                    primaryAction: () => Navigator.pop(context),
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
          ),
        ],
      ),
    );
  }
}
