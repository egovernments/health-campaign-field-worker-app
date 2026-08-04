import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';

import '../blocs/localization/app_localization.dart';
import '../data/local_store/app_shared_preferences.dart';
import '../router/app_router.dart';
import '../services/deep_link_service.dart';
import '../utils/environment_config.dart';
import '../utils/i18_key_constants.dart' as i18;

@RoutePage()
class DeepLinkWelcomePage extends StatelessWidget {
  final String? tenantId;
  final String? header;

  const DeepLinkWelcomePage({
    super.key,
    this.tenantId,
    this.header,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    final localizations = AppLocalizations.of(context);

    // Fall back to whatever the service currently has if args weren't passed.
    final payload = DeepLinkService.instance.pending;
    final resolvedTenant = tenantId ?? payload?.tenantId ?? '';
    final resolvedHeader = header ?? payload?.header ?? '';

    return Scaffold(
      appBar: AppBar(
        foregroundColor: theme.colorTheme.paper.primary,
        backgroundColor: theme.colorTheme.primary.primary2,
      ),
      body: ScrollableContent(
        children: [
          DigitCard(
            margin: const EdgeInsets.all(spacer2),
            children: [
              Text(
                localizations.translate(i18.deepLink.welcomeTitle),
                style: textTheme.headingXl.copyWith(
                  color: theme.colorTheme.primary.primary2,
                ),
              ),
              const SizedBox(height: spacer2),
              if (resolvedHeader.isNotEmpty)
                _InfoRow(
                  label: localizations.translate(i18.deepLink.headerLabel),
                  value: resolvedHeader,
                ),
              _InfoRow(
                label: localizations.translate(i18.deepLink.tenantIdLabel),
                value: resolvedTenant,
              ),
              const SizedBox(height: spacer4),
              DigitButton(
                label: localizations.translate(i18.deepLink.continueAction),
                type: DigitButtonType.primary,
                onPressed: () async {
                  final router = context.router;

                  if (resolvedTenant.isNotEmpty) {
                    envConfig.setTenantIdOverride(resolvedTenant);
                    await AppSharedPreferences()
                        .setTenantIdOverride(resolvedTenant);
                  }

                  DeepLinkService.instance.consumePending();
                  router.replaceAll([LoginRoute()]);
                },
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: spacer1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: textTheme.bodyL.copyWith(
                color: theme.colorTheme.text.secondary,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value.isEmpty ? '-' : value,
              style: textTheme.bodyL,
            ),
          ),
        ],
      ),
    );
  }
}
