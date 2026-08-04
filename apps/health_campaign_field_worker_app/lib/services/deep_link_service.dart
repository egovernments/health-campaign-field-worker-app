import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:digit_ui_components/utils/app_logger.dart';

class DeepLinkPayload {
  final String? tenantId;
  final String? header;
  final Uri raw;

  const DeepLinkPayload({this.tenantId, this.header, required this.raw});

  bool get isValid => (tenantId ?? '').isNotEmpty;

  @override
  String toString() =>
      'DeepLinkPayload(tenantId: $tenantId, header: $header, raw: $raw)';
}

class DeepLinkService {
  DeepLinkService._();
  static final DeepLinkService instance = DeepLinkService._();

  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _sub;

  DeepLinkPayload? _pending;
  final StreamController<DeepLinkPayload> _controller =
      StreamController<DeepLinkPayload>.broadcast();

  DeepLinkPayload? get pending => _pending;
  Stream<DeepLinkPayload> get stream => _controller.stream;

  Future<void> initialize() async {
    try {
      final initial = await _appLinks.getInitialLink();
      if (initial != null) {
        _pending = _parse(initial);
        AppLogger.instance.info(
          'Initial deep link captured: $_pending',
          title: 'DeepLinkService',
        );
      }
    } catch (e) {
      AppLogger.instance.error(
        title: 'DeepLinkService',
        message: 'Failed to read initial deep link: $e',
      );
    }

    _sub = _appLinks.uriLinkStream.listen(
      (uri) {
        final payload = _parse(uri);
        _pending = payload;
        _controller.add(payload);
        AppLogger.instance.info(
          'Runtime deep link received: $payload',
          title: 'DeepLinkService',
        );
      },
      onError: (Object err) {
        AppLogger.instance.error(
          title: 'DeepLinkService',
          message: 'Deep link stream error: $err',
        );
      },
    );
  }

  DeepLinkPayload _parse(Uri uri) {
    final params = uri.queryParameters;
    return DeepLinkPayload(
      tenantId: params['tenantId'] ?? params['tenantid'] ?? params['tenant'],
      header: params['header'] ?? params['name'] ?? params['label'],
      raw: uri,
    );
  }

  DeepLinkPayload? consumePending() {
    final p = _pending;
    _pending = null;
    return p;
  }

  DeepLinkPayload? parseString(String value) {
    try {
      final uri = Uri.parse(value.trim());
      if (uri.scheme.isEmpty) return null;
      final payload = _parse(uri);
      if (!payload.isValid) return null;
      _pending = payload;
      _controller.add(payload);
      return payload;
    } catch (_) {
      return null;
    }
  }

  Future<void> dispose() async {
    await _sub?.cancel();
    await _controller.close();
  }
}
