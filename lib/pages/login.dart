import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_campaigns_flutter/blocs/auth/auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: DigitCard(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Login',
                style: theme.textTheme.displayMedium,
              ),
              const DigitTextField(label: 'User ID'),
              const DigitTextField(label: 'Password'),
              const SizedBox(height: 16),
              DigitElevatedButton(
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
                child: const Center(
                  child: Text('Login'),
                ),
              ),
              TextButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return DigitDialog(
                        title: 'Forgot Password?',
                        primaryActionLabel: 'OK',
                        primaryAction: (() {}),
                        child: Text(
                          'Please contact the administrator if you have forgotten your password',
                          style: theme.textTheme.bodyLarge,
                        ),
                      );
                    },
                  );
                },
                child: const Center(
                  child: Text('Forgot Password?'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
