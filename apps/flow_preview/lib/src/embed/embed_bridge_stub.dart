/// Non-browser stand-in for the embed bridge (tests and analysis on the VM).
class EmbedBridge {
  static bool get hasParent => false;

  static void listen(void Function(Map<String, dynamic> message) onMessage) {}

  static void send(Map<String, dynamic> message) {}
}
