import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import '../blocs/flow_crud_bloc.dart';
import '../blocs/search_state_manager.dart';
import '../flow_builder.dart' show FlowRegistry;
import 'debug_viewer_html.dart';
import 'flow_debugger.dart';

/// Lightweight HTTP + WebSocket server for the browser-based debug viewer.
///
/// Serves a self-contained HTML page and streams debug events over WebSocket.
/// All methods are no-op in release mode.
class DebugServer {
  static final DebugServer _instance = DebugServer._();
  factory DebugServer() => _instance;
  DebugServer._();

  HttpServer? _server;
  final List<WebSocket> _clients = [];
  Timer? _stateTimer;
  String? _debugUrl;
  VoidCallback? _eventsListener;

  /// The URL to open in a browser. Null if not started.
  String? get debugUrl => _debugUrl;

  /// Start the debug server. No-op in release mode or if already running.
  Future<void> start() async {
    if (kReleaseMode || _server != null) return;

    try {
      _server = await _tryBind();
      final port = _server!.port;
      final ip = await _getDeviceIp();
      _debugUrl = 'http://$ip:$port';
      debugPrint('FlowDebugServer: Listening at $_debugUrl');

      _server!.listen(_handleRequest);
      _listenToEvents();
      _startStateTimer();
    } catch (e) {
      debugPrint('FlowDebugServer: Failed to start: $e');
    }
  }

  /// Stop the server and clean up.
  Future<void> stop() async {
    if (kReleaseMode) return;

    _stateTimer?.cancel();
    _stateTimer = null;
    _removeEventsListener();

    for (final client in _clients) {
      try {
        await client.close();
      } catch (_) {}
    }
    _clients.clear();

    await _server?.close(force: true);
    _server = null;
    _debugUrl = null;
    debugPrint('FlowDebugServer: Stopped');
  }

  /// Try ports 8088-8098 until one binds.
  Future<HttpServer> _tryBind() async {
    for (var port = 8088; port <= 8098; port++) {
      try {
        return await HttpServer.bind(InternetAddress.anyIPv4, port);
      } on SocketException {
        continue;
      }
    }
    throw Exception('Could not bind to any port in range 8088-8098');
  }

  /// Resolve the device's WiFi IP address.
  Future<String> _getDeviceIp() async {
    try {
      final interfaces = await NetworkInterface.list(
        type: InternetAddressType.IPv4,
        includeLoopback: false,
      );
      for (final iface in interfaces) {
        // Prefer wlan/en (WiFi) interfaces
        final name = iface.name.toLowerCase();
        if (name.startsWith('wlan') ||
            name.startsWith('en') ||
            name.startsWith('wifi')) {
          if (iface.addresses.isNotEmpty) {
            return iface.addresses.first.address;
          }
        }
      }
      // Fallback: first non-loopback IPv4
      for (final iface in interfaces) {
        if (iface.addresses.isNotEmpty) {
          return iface.addresses.first.address;
        }
      }
    } catch (_) {}
    return '127.0.0.1';
  }

  void _handleRequest(HttpRequest request) async {
    final path = request.uri.path;

    if (path == '/ws') {
      _handleWebSocket(request);
      return;
    }

    if (path == '/api/events') {
      _handleApiEvents(request);
      return;
    }

    if (path == '/api/state') {
      _handleApiState(request);
      return;
    }

    if (path == '/api/configs') {
      _handleApiConfigs(request);
      return;
    }

    // Serve HTML page for everything else
    request.response
      ..statusCode = HttpStatus.ok
      ..headers.contentType = ContentType.html
      ..write(debugViewerHtml);
    await request.response.close();
  }

  void _handleWebSocket(HttpRequest request) async {
    try {
      final socket = await WebSocketTransformer.upgrade(request);
      _clients.add(socket);
      debugPrint('FlowDebugServer: Client connected (${_clients.length} total)');

      socket.listen(
        (data) => _handleClientMessage(socket, data),
        onDone: () {
          _clients.remove(socket);
          debugPrint(
              'FlowDebugServer: Client disconnected (${_clients.length} total)');
        },
        onError: (_) => _clients.remove(socket),
      );
    } catch (e) {
      debugPrint('FlowDebugServer: WebSocket upgrade failed: $e');
      request.response
        ..statusCode = HttpStatus.internalServerError
        ..write('WebSocket upgrade failed');
      await request.response.close();
    }
  }

  void _handleClientMessage(WebSocket socket, dynamic data) {
    try {
      final msg = jsonDecode(data as String) as Map<String, dynamic>;
      switch (msg['type']) {
        case 'requestEvents':
          _sendTo(socket, {
            'type': 'eventBatch',
            'data': FlowDebugger()
                .events
                .value
                .map((e) => e.toJson())
                .toList(),
          });
          break;
        case 'requestState':
          _sendTo(socket, {
            'type': 'stateSnapshot',
            'data': _buildStateSnapshot(),
          });
          break;
        case 'requestConfigs':
          _sendTo(socket, {
            'type': 'flowConfigs',
            'data': _deepConvert(FlowRegistry.getAllConfigs()),
          });
          break;
        case 'clearEvents':
          FlowDebugger().clear();
          _broadcast({'type': 'eventsCleared'});
          break;
      }
    } catch (e) {
      debugPrint('FlowDebugServer: Error handling message: $e');
    }
  }

  void _handleApiEvents(HttpRequest request) async {
    final events =
        FlowDebugger().events.value.map((e) => e.toJson()).toList();
    request.response
      ..statusCode = HttpStatus.ok
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(events));
    await request.response.close();
  }

  void _handleApiState(HttpRequest request) async {
    request.response
      ..statusCode = HttpStatus.ok
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(_buildStateSnapshot()));
    await request.response.close();
  }

  void _handleApiConfigs(HttpRequest request) async {
    request.response
      ..statusCode = HttpStatus.ok
      ..headers.contentType = ContentType.json
      ..write(jsonEncode(_deepConvert(FlowRegistry.getAllConfigs())));
    await request.response.close();
  }

  /// Listen to FlowDebugger events and broadcast new ones.
  void _listenToEvents() {
    _eventsListener = () {
      if (_clients.isEmpty) return;
      final events = FlowDebugger().events.value;
      if (events.isNotEmpty) {
        _broadcast({
          'type': 'event',
          'data': events.last.toJson(),
        });
      }
    };
    FlowDebugger().events.addListener(_eventsListener!);
  }

  void _removeEventsListener() {
    if (_eventsListener != null) {
      FlowDebugger().events.removeListener(_eventsListener!);
      _eventsListener = null;
    }
  }

  /// Send periodic state snapshots when clients are connected.
  void _startStateTimer() {
    _stateTimer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (_clients.isEmpty) return;
      _broadcast({
        'type': 'stateSnapshot',
        'data': _buildStateSnapshot(),
      });
    });
  }

  /// Build a JSON-safe snapshot of current state registries with full data.
  Map<String, dynamic> _buildStateSnapshot() {
    final crudStates = <String, dynamic>{};
    final registry = FlowCrudStateRegistry();
    for (final entry in registry.debugStateMap.entries) {
      final state = entry.value.value;
      if (state == null) continue;
      crudStates[entry.key] = {
        'isLoading': state.isLoading,
        'stateWrapper': _deepConvert(state.stateWrapper),
        'stateWrapperLength': state.stateWrapper?.length,
        'formData': _deepConvert(state.formData),
        'widgetData': _deepConvert(state.widgetData),
      };
    }

    final searchStates = <String, dynamic>{};
    final searchMgr = SearchStateManager();
    for (final entry in searchMgr.debugState.entries) {
      searchStates[entry.key] = _deepConvert(entry.value);
    }

    return {
      'crudStates': crudStates,
      'searchStates': searchStates,
      'flowConfigs': _deepConvert(FlowRegistry.getAllConfigs()),
    };
  }

  /// Recursively convert any value to a JSON-safe structure.
  ///
  /// For EntityModel instances, calls `toMap()` to get all fields.
  /// [depth] prevents infinite recursion on circular references.
  dynamic _deepConvert(dynamic value, [int depth = 0]) {
    if (depth > 8) return '<max depth>';
    if (value == null || value is num || value is bool || value is String) {
      return value;
    }
    if (value is DateTime) {
      return value.toIso8601String();
    }
    if (value is Duration) {
      return '${value.inMilliseconds}ms';
    }
    if (value is List) {
      return value.map((e) => _deepConvert(e, depth + 1)).toList();
    }
    if (value is Map) {
      return value.map(
        (k, v) => MapEntry(k.toString(), _deepConvert(v, depth + 1)),
      );
    }
    // Try toMap() for EntityModel and similar objects
    try {
      final map = (value as dynamic).toMap() as Map;
      return _deepConvert(map, depth + 1);
    } catch (_) {}
    // Try toJson() as fallback
    try {
      final json = (value as dynamic).toJson();
      if (json is Map || json is List) return _deepConvert(json, depth + 1);
      if (json is String) return json;
    } catch (_) {}
    return value.toString();
  }

  void _broadcast(Map<String, dynamic> message) {
    final encoded = jsonEncode(message);
    final dead = <WebSocket>[];
    for (final client in _clients) {
      try {
        client.add(encoded);
      } catch (_) {
        dead.add(client);
      }
    }
    for (final d in dead) {
      _clients.remove(d);
    }
  }

  void _sendTo(WebSocket socket, Map<String, dynamic> message) {
    try {
      socket.add(jsonEncode(message));
    } catch (_) {
      _clients.remove(socket);
    }
  }
}
