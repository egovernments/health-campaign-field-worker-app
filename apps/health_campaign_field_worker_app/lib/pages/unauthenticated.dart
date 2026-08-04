import 'dart:async';

import 'package:flutter/material.dart';
import '../data/local_store/app_shared_preferences.dart';
import '../router/app_router.dart';
import '../services/deep_link_service.dart';
import '../widgets/error_screen.dart';
import 'error_boundary.dart';

@RoutePage()
class UnauthenticatedPageWrapper extends StatefulWidget {
  const UnauthenticatedPageWrapper({super.key});

  @override
  State<UnauthenticatedPageWrapper> createState() =>
      _UnauthenticatedPageWrapperState();
}

class _UnauthenticatedPageWrapperState
    extends State<UnauthenticatedPageWrapper> {
  StreamSubscription<DeepLinkPayload>? _sub;
  bool _initialDispatched = false;

  @override
  void initState() {
    super.initState();
    // On first frame:
    //   1. If a deep link was captured at app start, jump to welcome.
    //   2. Else if the app has no persisted tenant (fresh install /
    //      post-clear-storage), send the user to the QR bootstrap page —
    //      language and login are meaningless until a tenant is configured.
    //   3. Else fall through: LanguageSelectionRoute is the initial child
    //      and takes over on its own.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_initialDispatched || !mounted) return;

      final pending = DeepLinkService.instance.pending;
      if (pending != null && pending.isValid) {
        _initialDispatched = true;
        _pushWelcome(pending);
        return;
      }

      final storedTenant = AppSharedPreferences().getTenantIdOverride;
      if (storedTenant == null || storedTenant.isEmpty) {
        _initialDispatched = true;
        context.router.replaceAll([TenantBootstrapRoute()]);
      }
    });

    // Also react to deep links that arrive while the app is running.
    _sub = DeepLinkService.instance.stream.listen((payload) {
      if (!mounted || !payload.isValid) return;
      _pushWelcome(payload);
    });
  }

  void _pushWelcome(DeepLinkPayload payload) {
    if (!mounted) return;
    context.router.push(
      DeepLinkWelcomeRoute(
        tenantId: payload.tenantId,
        header: payload.header,
      ),
    );
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      ErrorBoundary(builder: (context, error) {
        return error != null ? const ErrorScreen() : const AutoRouter();
      });
}
