import 'package:digit_scanner/blocs/scanner.dart';
import 'package:digit_scanner/pages/qr_scanner.dart';
import 'package:digit_ui_components/digit_components.dart';
import 'package:digit_ui_components/theme/digit_extended_theme.dart';
import 'package:digit_ui_components/widgets/molecules/digit_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../router/app_router.dart';
import '../services/deep_link_service.dart';
import '../utils/i18_key_constants.dart' as i18;
import '../widgets/localized.dart';

/// Shown as the unauthenticated entry on a fresh install (no persisted
/// `tenantIdOverride`) — the app has no server/tenant configured yet, so
/// the only meaningful action is to scan the setup QR shared by ops.
@RoutePage()
class TenantBootstrapPage extends LocalizedStatefulWidget {
  const TenantBootstrapPage({
    Key? key,
    super.appLocalizations,
  }) : super(key: key);

  @override
  State<TenantBootstrapPage> createState() => _TenantBootstrapPageState();
}

class _TenantBootstrapPageState extends LocalizedState<TenantBootstrapPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.digitTextTheme(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        foregroundColor: theme.colorTheme.paper.primary,
        backgroundColor: theme.colorTheme.primary.primary2,
      ),
      body: ScrollableContent(
        children: [
          DigitCard(
            margin: const EdgeInsets.all(spacer2),
            children: [
              Icon(
                Icons.qr_code_scanner,
                size: 96,
                color: theme.colorTheme.primary.primary2,
              ),
              const SizedBox(height: spacer2),
              Text(
                localizations.translate(i18.deepLink.bootstrapTitle),
                style: textTheme.headingXl.copyWith(
                  color: theme.colorTheme.primary.primary2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: spacer2),
              Text(
                localizations.translate(i18.deepLink.bootstrapDescription),
                style: textTheme.bodyL.copyWith(
                  color: theme.colorTheme.text.secondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: spacer4),
              DigitButton(
                label:
                    localizations.translate(i18.deepLink.bootstrapScanAction),
                type: DigitButtonType.primary,
                prefixIcon: Icons.qr_code_scanner,
                size: DigitButtonSize.large,
                mainAxisSize: MainAxisSize.max,
                onPressed: () => _openScanner(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _openScanner(BuildContext context) async {
    final navigator = Navigator.of(context);
    final router = context.router;
    final scannerBloc = context.read<DigitScannerBloc>();

    // Reset the bloc so we only read codes captured on this scan.
    scannerBloc.add(
      const DigitScannerEvent.handleScanner(barCode: [], qrCode: []),
    );

    await navigator.push<void>(
      MaterialPageRoute<void>(
        builder: (_) => const DigitScannerPage(
          quantity: 1,
          singleValue: true,
          isGS1code: false,
        ),
        fullscreenDialog: true,
      ),
    );

    if (!mounted) return;

    final codes = scannerBloc.state.qrCodes;
    if (codes.isEmpty) return;

    final payload = DeepLinkService.instance.parseString(codes.first);
    // Clear so a subsequent scan doesn't reuse this value.
    scannerBloc.add(
      const DigitScannerEvent.handleScanner(barCode: [], qrCode: []),
    );

    if (payload == null || !payload.isValid) {
      if (!mounted) return;
      Toast.showToast(
        context,
        message: localizations.translate(i18.deepLink.invalidQrCode),
        type: ToastType.error,
      );
      return;
    }

    router.replaceAll([
      DeepLinkWelcomeRoute(
        tenantId: payload.tenantId,
        header: payload.header,
      ),
    ]);
  }
}
