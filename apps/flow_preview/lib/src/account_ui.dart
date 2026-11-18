import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';

import 'digit_account.dart';

/// Card on the home page: who is signed in and which project flows use.
class AccountCard extends StatelessWidget {
  final DigitAccount account;
  final VoidCallback onSignIn;
  final VoidCallback onChangeProject;

  const AccountCard({
    super.key,
    required this.account,
    required this.onSignIn,
    required this.onChangeProject,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return ListenableBuilder(
      listenable: account,
      builder: (context, _) {
        final p = account.project;
        return Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: account.signedIn
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Signed in as ${account.userName}',
                          style: text.titleSmall),
                      const SizedBox(height: 4),
                      Text(
                        p == null
                            ? 'No project selected'
                            : '${p.name} (${p.referenceID ?? p.id})\n'
                                'Project type: ${account.projectType?.code ?? 'none'}'
                                ' · ${account.projectType?.cycles?.length ?? 0} cycles'
                                '\nBoundary: ${account.boundary?.name ?? p.address?.boundary ?? '-'}',
                        style: text.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      Wrap(spacing: 8, children: [
                        OutlinedButton(
                            onPressed: onChangeProject,
                            child: const Text('Change project')),
                        TextButton(
                            onPressed: account.signOut,
                            child: const Text('Sign out')),
                      ]),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Sample user and project', style: text.titleSmall),
                      const SizedBox(height: 4),
                      Text(
                        'Sign in to run flows with your real project, project '
                        'type (cycles, eligibility) and boundary. Forms still '
                        'save only in this browser.',
                        style: text.bodySmall,
                      ),
                      const SizedBox(height: 8),
                      FilledButton(
                          onPressed: onSignIn, child: const Text('Sign in')),
                    ],
                  ),
          ),
        );
      },
    );
  }
}

/// Sign-in dialog. The user types their own credentials; the password is
/// sent once to the server and not kept.
Future<bool> showSignInDialog(BuildContext context, DigitAccount account) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (_) => _SignInDialog(account: account),
  );
  return ok ?? false;
}

class _SignInDialog extends StatefulWidget {
  final DigitAccount account;

  const _SignInDialog({required this.account});

  @override
  State<_SignInDialog> createState() => _SignInDialogState();
}

class _SignInDialogState extends State<_SignInDialog> {
  final _user = TextEditingController();
  final _password = TextEditingController();
  final _tenant = TextEditingController();
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _password.clear();
    _user.dispose();
    _password.dispose();
    _tenant.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await widget.account.signIn(
        username: _user.text.trim(),
        password: _password.text,
        tenant: _tenant.text.trim(),
      );
      _password.clear();
      if (mounted) Navigator.pop(context, true);
    } catch (e) {
      setState(() => _error = e.toString().replaceFirst('Exception: ', ''));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sign in to DIGIT'),
      content: SizedBox(
        width: 360,
        child: AutofillGroup(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            TextField(
              controller: _user,
              autofillHints: const [AutofillHints.username],
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _password,
              obscureText: true,
              autofillHints: const [AutofillHints.password],
              decoration: const InputDecoration(labelText: 'Password'),
              onSubmitted: (_) => _busy ? null : _submit(),
            ),
            TextField(
              controller: _tenant,
              decoration: const InputDecoration(
                labelText: 'Tenant',
                helperText: 'Leave empty to use the one under Messages.',
              ),
            ),
            if (_error != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(_error!,
                    style: TextStyle(color: Theme.of(context).colorScheme.error)),
              ),
          ]),
        ),
      ),
      actions: [
        TextButton(
            onPressed: _busy ? null : () => Navigator.pop(context, false),
            child: const Text('Cancel')),
        FilledButton(
            onPressed: _busy ? null : _submit,
            child: Text(_busy ? 'Signing in…' : 'Sign in')),
      ],
    );
  }
}

/// Lets the user pick one of their projects.
Future<ProjectModel?> showProjectPicker(
    BuildContext context, List<ProjectModel> projects) {
  return showDialog<ProjectModel>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Choose a project'),
      content: SizedBox(
        width: 420,
        child: projects.isEmpty
            ? const Text('This user is not assigned to any project.')
            : ListView(
                shrinkWrap: true,
                children: [
                  for (final p in projects)
                    ListTile(
                      title: Text(p.name),
                      subtitle: Text([
                        p.referenceID ?? p.id,
                        p.additionalDetails?.projectType?.code,
                        p.address?.boundary,
                      ].whereType<String>().join(' · ')),
                      onTap: () => Navigator.pop(ctx, p),
                    ),
                ],
              ),
      ),
      actions: [
        TextButton(
            onPressed: () => Navigator.pop(ctx), child: const Text('Cancel')),
      ],
    ),
  );
}


/// The flow configs created for the selected project, as buttons, like the
/// app's home screen modules.
class ProjectModules extends StatelessWidget {
  final DigitAccount account;
  final void Function(Map<String, dynamic> config) onOpen;

  const ProjectModules({super.key, required this.account, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return ListenableBuilder(
      listenable: account,
      builder: (context, _) {
        if (!account.signedIn || account.project == null) {
          return const SizedBox.shrink();
        }
        final configs = account.projectConfigs;
        return Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(
                  child: Text(
                      'Modules for ${account.project!.referenceID ?? account.project!.name}'
                      '${configs.isEmpty ? '' : ' (${configs.length})'}',
                      style: text.titleSmall),
                ),
                IconButton(
                  tooltip: 'Reload configs',
                  onPressed:
                      account.loadingConfigs ? null : account.loadProjectConfigs,
                  icon: const Icon(Icons.refresh),
                ),
              ]),
              if (account.loadingConfigs) const LinearProgressIndicator(),
              if (account.configsError != null)
                Text(account.configsError!,
                    style: TextStyle(color: Theme.of(context).colorScheme.error)),
              if (!account.loadingConfigs &&
                  account.configsError == null &&
                  configs.isEmpty)
                Text('No configs found for this project.', style: text.bodySmall),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  for (final c in configs)
                    _ModuleButton(config: c, onOpen: onOpen),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class _ModuleButton extends StatelessWidget {
  final Map<String, dynamic> config;
  final void Function(Map<String, dynamic> config) onOpen;

  const _ModuleButton({required this.config, required this.onOpen});

  @override
  Widget build(BuildContext context) {
    final name = (config['name'] ?? '?').toString();
    final flows = config['flows'];
    final screens = flows is List ? flows.length : 0;
    final disabled = config['disabled'] == true;
    final openable = screens > 0;
    return Tooltip(
      message: openable
          ? '$screens screens, starts at ${config['initialPage']}'
              '${disabled ? ' (disabled in the console)' : ''}'
          : 'Not a flow config (no screens)',
      child: FilledButton.tonal(
        onPressed: openable ? () => onOpen(config) : null,
        child: Text(disabled ? '$name (disabled)' : name),
      ),
    );
  }
}
