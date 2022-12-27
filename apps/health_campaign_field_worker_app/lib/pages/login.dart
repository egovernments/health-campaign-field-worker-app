import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth.dart';
import '../utils/18KeyConstants.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
                  i18.login.labelText,
                  style: theme.textTheme.displayMedium,
                ),
                DigitTextField(label: i18.login.userIdPlaceholder),
                DigitTextField(label: i18.login.passwordPlaceholder),
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
                      child: Text(i18.login.actionLabel),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => DigitDialog.show(
                    context,
                    title: i18.forgetPassword.labelText,
                    content: i18.forgetPassword.contentText,
                    primaryActionLabel: i18.forgetPassword.primaryActionLabel,
                    primaryAction: () => Navigator.pop(context),
                  ),
                  child: Center(child: Text(i18.forgetPassword.actionLabel)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
