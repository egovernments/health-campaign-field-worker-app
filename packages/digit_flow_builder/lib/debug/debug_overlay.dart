import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'debug_server.dart';
import 'flow_debugger.dart';

/// Wrap your app (or a subtree) with this widget to enable the debugger:
/// ```dart
/// FlowDebugOverlay(child: MyApp())
/// ```
///
/// Starts the [DebugServer] on mount and stops it on unmount. Prints the
/// server URL prominently on start (see [DebugServer.start]) — open that URL
/// in any browser on the same WiFi to see live debug data.
///
/// In release mode, this renders only [child] with zero overhead.
class FlowDebugOverlay extends StatefulWidget {
  final Widget child;

  const FlowDebugOverlay({super.key, required this.child});

  @override
  State<FlowDebugOverlay> createState() => _FlowDebugOverlayState();
}

class _FlowDebugOverlayState extends State<FlowDebugOverlay> {
  @override
  void initState() {
    super.initState();
    if (!kReleaseMode) {
      FlowDebugger().enabled = true;
      DebugServer().start();
    }
  }

  @override
  void dispose() {
    if (!kReleaseMode) {
      DebugServer().stop();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
