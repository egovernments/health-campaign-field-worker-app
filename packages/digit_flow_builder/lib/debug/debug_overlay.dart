import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'debug_event.dart';
import 'debug_server.dart';
import 'flow_debugger.dart';

/// Overlay widget that provides a floating debug button.
///
/// Wrap your app (or a subtree) with this widget to enable the debugger:
/// ```dart
/// FlowDebugOverlay(child: MyApp())
/// ```
///
/// Tapping the purple FAB prints the debug viewer URL to the console.
/// Open that URL in any browser on the same WiFi to see live debug data.
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
  Widget build(BuildContext context) {
    if (kReleaseMode) return widget.child;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Stack(
        children: [
          widget.child,
          Positioned(
            right: 12,
            bottom: 80,
            child: _FloatingDebugButton(
              onTap: () {
                final url = DebugServer().debugUrl;
                if (url != null) {
                  debugPrint('==========================================');
                  debugPrint('Flow Debugger: $url');
                  debugPrint('==========================================');
                } else {
                  debugPrint('Flow Debugger: Server not started yet');
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _FloatingDebugButton extends StatelessWidget {
  final VoidCallback onTap;

  const _FloatingDebugButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ValueListenableBuilder<List<FlowDebugEvent>>(
        valueListenable: FlowDebugger().events,
        builder: (context, events, _) {
          return Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.deepPurple,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(Icons.bug_report, color: Colors.white, size: 24),
                if (events.isNotEmpty)
                  Positioned(
                    top: 4,
                    right: 4,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        events.length > 99 ? '99+' : '${events.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
